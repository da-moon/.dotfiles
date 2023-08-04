#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

if type -P "rustup" >/dev/null; then
  eval "$(rustup completions bash rustup)"
  # FIXME : currently broken
  # [ ! -d "$(rustc --print sysroot)/etc/bash_completion.d" ] && mkdir -p "$(rustc --print sysroot)/etc/bash_completion.d"
  # if [ ! -r "$(rustc --print sysroot)/etc/bash_completion.d/cargo" ]; then
  #   if [ -d "/usr/share/bash-completion/completions" ]; then
  #     ln -sf "/usr/share/bash-completion/completions/cargo" "$(rustc --print sysroot)/etc/bash_completion.d/cargo"
  #   fi
  # fi
  # eval "$(rustup completions bash cargo)"
fi
