#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if command -- exa -h >/dev/null  2>&1; then
  alias llfu='exa -bghHliS --git'
  alias ls="exa"
  alias ll="exa -lhF"
  alias la="exa -alhF"
  alias llfu='exa -bghHliS --git'
  alias llt='exa -T'
fi
