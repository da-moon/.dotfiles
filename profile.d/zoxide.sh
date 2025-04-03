#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if [ -x "$(command -v zoxide)" ]; then
  export _ZO_DOCTOR=0
  eval "$(zoxide init bash)"
  alias cd="pushd . && z"
fi
