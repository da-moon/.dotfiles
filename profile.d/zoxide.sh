#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init bash)"
  alias cd="pushd . && z"
fi
