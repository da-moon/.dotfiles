#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if command -- eza -h >/dev/null  2>&1; then
  alias ls="eza"
  alias ll="eza -lhF"
  alias la="eza -alhF"
  alias llfu='eza -bghHliS --git'
  alias llt='eza -T'
fi
