# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if [ -d "${HOME}/.cargo" ];then
  export CARGO_HOME="${HOME}/.cargo"
  export PATH="${CARGO_HOME}/bin:${PATH}"
fi
