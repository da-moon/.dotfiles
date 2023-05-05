#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

if [ -x "$(command -v starship)" ];then
  # [ -r "${HOME}/.config/starship-bash.toml" ] && export STARSHIP_CONFIG="${HOME}/.config/starship-bash.toml" ;
  eval "$(starship init bash)"
fi