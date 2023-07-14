#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

if type -P "rustup" >/dev/null; then
  if { [ ! -d "$(rustc --print sysroot)/etc/bash_completion.d" ] && [ -d "/usr/share/bash-completion/completions" ];  }; then
    ln -sf "/usr/share/bash-completion/completions" "$(rustc --print sysroot)/etc/bash_completion.d"
  fi
  eval "$(rustup completions bash rustup)"
  eval "$(rustup completions bash cargo)"
fi
