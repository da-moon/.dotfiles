#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

if [ -x "$(command -v zellij)" ] ; then
  if printenv | grep -Pq 'WINDOW|TERMINAL'; then
    # [ -d "${HOME}/sync" ] && pushd "${HOME}/sync" > /dev/null 2>&1 ;
    export ZELLIJ_AUTO_EXIT="true" ;
    eval "$(zellij setup --generate-auto-start bash)" ;
  fi
fi
