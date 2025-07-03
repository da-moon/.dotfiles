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
  "PSReadLine" ,
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
$AnalyzerSettings = @{
    IncludeRules = @(
        # style rules you already had
        'PSPlaceOpenBrace', 'PSUseConsistentIndentation',
        'PSUseConsistentWhitespace', 'PSAlignAssignmentStatement',
        # compatibility rule family
        'PSUseCompatibleSyntax',     # language features
        'PSUseCompatibleCommands',   # cmdlets / functions
        'PSUseCompatibleTypes'       # .NET types
    )
    Rules        = @{
        PSPlaceOpenBrace           = @{
            Enable     = $true
            OnSameLine = $true
        }
        PSUseConsistentIndentation = @{
            Enable          = $true
            IndentationSize = 4
            Kind            = 'space'
        }
        PSUseConsistentWhitespace  = @{
            Enable         = $true
            CheckOpenBrace = $true
            CheckOpenParen = $true
            CheckOperator  = $true
            CheckSeparator = $true
        }
        PSAlignAssignmentStatement = @{
            Enable         = $true
            CheckHashtable = $true
        }
        PSUseCompatibleSyntax = @{
            Enable         = $true
            TargetVersions = @('5.1')
        }

        # PSUseCompatibleCommands = @{
        #     Enable         = $true
        #     TargetProfiles = @(
        #         # Windows PowerShell 5.1 (built-in profile)
        #         'win-8_x64_10.0.14393.0_5.1.14393.2791_x64_4.0.30319.42000_framework',
        #         # Optional: add macOS/Linux PowerShell 7.x to ensure true cross-platform
        #         'ubuntu_x64_22.04_7.4.0_x64_8.0.0_core'
        #     )
        # }

        # PSUseCompatibleTypes = @{
        #     Enable         = $true
        #     TargetProfiles = @(
        #         'win-8_x64_10.0.14393.0_5.1.14393.2791_x64_4.0.30319.42000_framework'
        #     )
        # }
    }
}
function Format-PSScript {
    [CmdletBinding()]
    param (
        [string]$Path = $MyInvocation.MyCommand.ScriptBlock.File
    )
    process {
        $content = Get-Content -Path $Path -Raw
        $content = Invoke-Formatter -Settings $AnalyzerSettings -ScriptDefinition $content
        $content | Set-Content -NoNewline -Encoding ascii -Path $Path
    }
}
function Lint-PSScript {
    [CmdletBinding()]
    param (
        [string]$Path = $MyInvocation.MyCommand.ScriptBlock.File
    )
    process {
        Invoke-ScriptAnalyzer -Settings $AnalyzerSettings -Path $Path
    }
}

if ($host.Name -eq "ConsoleHost") {
    Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
}

Set-PSReadLineOption -EditMode Emacs

# Word movement with Ctrl+Arrow (bash-style)
Set-PSReadLineKeyHandler -Chord 'Ctrl+LeftArrow' -Function BackwardWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+RightArrow' -Function ForwardWord

# Essential bash keybindings only
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Chord 'Ctrl+a' -Function BeginningOfLine
Set-PSReadLineKeyHandler -Chord 'Ctrl+e' -Function EndOfLine
Set-PSReadLineKeyHandler -Chord 'Ctrl+u' -Function BackwardDeleteLine
Set-PSReadLineKeyHandler -Chord 'Ctrl+k' -Function ForwardDeleteLine
Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+l' -Function ClearScreen
Set-PSReadlineKeyHandler -Key 'Alt+Backspace' -Function BackwardKillWord

# Ctrl+D to exit on empty line (like bash)
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -ScriptBlock {
    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    if ($line.Length -eq 0) {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert('exit')
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    } else {
        [Microsoft.PowerShell.PSConsoleReadLine]::Delete()
    }
}

# History search
Set-PSReadLineKeyHandler -Chord 'Ctrl+r' -Function ReverseSearchHistory

# Basic history settings
Set-PSReadLineOption -HistoryNoDuplicates:$True
Set-PSReadLineOption -MaximumHistoryCount 1000

# Disable pager
$env:PAGER = 'cat'
