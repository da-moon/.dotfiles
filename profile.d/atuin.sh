#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if atuin --version >/dev/null  2>&1; then
  # [[ ! -r "${HOME}/.bash-preexec.sh" ]] && curl -fSslLo "${HOME}/.bash-preexec.sh" "https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh"
  # source "${HOME}/.bash-preexec.sh"
  [ -r "/usr/share/bash-preexec/bash-preexec.sh" ] && {
    source "/usr/share/bash-preexec/bash-preexec.sh"
    eval "$(atuin init bash)"
  }
fi
