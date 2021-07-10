if command -- terraform -h > /dev/null 2>&1 ; then
  alias tf="terraform"
  alias tfi="terraform init"
  alias tfa="terraform apply -auto-approve"
  alias tfd="terraform destroy -auto-approve"
  alias tfp="terraform plan"
  alias tfw="terraform workspace"
  alias tfwl="terraform workspace list"
  alias tfws="terraform workspace select"
  alias tfo="terraform output"
fi