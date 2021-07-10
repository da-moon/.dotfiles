if command -- vault -h > /dev/null 2>&1 ; then
  export VAULT_SKIP_VERIFY="true"
fi
if command -- consul -h > /dev/null 2>&1 ; then
  export CONSUL_SCHEME="https"
  export CONSUL_HTTP_SSL="true"
  export CONSUL_HTTP_SSL_VERIFY="false"
fi