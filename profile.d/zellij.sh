#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

# Only proceed if zellij is on PATH and executable
if command -v zellij >/dev/null 2>&1; then

  # 1) Skip if any environment variable is prefixed with WARP_
  if env | grep -q '^WARP_'; then
    # We are in Warp; do nothing (skip)
    :
  # 2) Skip if this shell is not interactive
  elif [[ $- != *i* ]]; then
    :
  # 3) Optionally skip if already in zellij (avoid nested zellij)
  elif [ -n "$ZELLIJ" ]; then
    :
  else
    # 4) Check if the parent process matches conditions to skip
    ppid=$(ps -o ppid= -p $$)
    terminal=$(ps -o comm= -p $ppid)
    case "${terminal}" in
      warp | zellij | tilda | poetry | node | zed-editor | sshd-session)
        # Parent process is one of these; do nothing
        ;;
      *)
        # Extra skip for certain TERM_PROGRAM values
        if [ "${TERM_PROGRAM}" != "vscode" ] && [ "${TERM_PROGRAM}" != "zed" ]; then
          # Start Zellij automatically
          eval "$(zellij setup --generate-auto-start bash)"
      fi
        ;;
    esac
  fi

fi
