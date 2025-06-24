# Set execution policy for current user (Windows only)
if ($IsWindows) {
  if ((Get-ExecutionPolicy -Scope CurrentUser) -ne "RemoteSigned") {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
  }
}

# Set PSGallery as trusted only if not already trusted
if ((Get-PSRepository -Name "PSGallery").InstallationPolicy -ne "Trusted") {
  Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
}

# Install and import modules only if needed
@(
  # "VMware.VimAutomation.Core",
  # 'VMware.VimAutomation.Hcx',
  # 'VMware.VimAutomation.Nsxt',
  "PSScriptTools",
  "PSScriptAnalyzer",
  "Microsoft.PowerShell.SecretStore"
) | ForEach-Object {
  if (-not (Get-Module -ListAvailable -Name $_ -ErrorAction SilentlyContinue)) {
    Install-Module -Force -AllowClobber -SkipPublisherCheck -Name $_ -Scope CurrentUser
  }
  if (-not (Get-Module -Name $_)) {
    Import-Module $_ -ErrorAction Stop
  }
}

# Configure SecretStore if not already configured
try {
  # If configured but locked, unlock it
  Unlock-SecretStore -Password (ConvertTo-SecureString "00000000" -AsPlainText -Force) -ErrorAction SilentlyContinue
}
catch {
  # First time setup - configure with password
  Set-SecretStoreConfiguration -Scope CurrentUser -Authentication Password -PasswordTimeout 3600 -Interaction None -Password (ConvertTo-SecureString "00000000" -AsPlainText -Force) -Confirm:$false
}
# Register SecretVault only if not already registered
try {
  Get-SecretVault -Name "SecretStore" -ErrorAction Stop 2>&1 | Out-Null
}
catch {
  Register-SecretVault -Name SecretStore -ModuleName Microsoft.PowerShell.SecretStore -DefaultVault
}

if (Get-Module -Name "VMware.VimAutomation.Core" -ErrorAction SilentlyContinue) {
  $config = Get-PowerCLIConfiguration -Scope User
  if ($config.ParticipateInCeip -ne $false) {
    Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false
  }
  if ($config.InvalidCertificateAction -ne "Ignore") {
    Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction Ignore -Confirm:$false
  }
}
