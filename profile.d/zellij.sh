#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

if [ -x "$(command -v zellij)" ]; then
    terminal="$(ps -o comm= -p $(ps -o ppid= -p $$))"
    # if printenv | grep -Pq 'WINDOW|TERMINAL'; then
    case "${terminal}" in
       "warp" | "tilda" | "poetry" | "node" | "zed-editor")
        # No action needed, terminal matches one of the conditions
      ;;
      *)
        # [ -d "${HOME}/sync" ] && pushd "${HOME}/sync" > /dev/null 2>&1 ;
        # if ! { printenv | grep -qP 'KITTY_'; };then
        #   export ZELLIJ_AUTO_EXIT="true" ;
        # fi
        if [ "${TERM_PROGRAM}" != "vscode" ] && [ "${TERM_PROGRAM}" != "zed" ]; then
          eval "$(zellij setup --generate-auto-start bash)"
    fi
      ;;
  esac
fi
