#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

if [ -d "${HOME}/.dotfiles" ];then
  git -C "${HOME}/.dotfiles" submodule update --init --recursive >/dev/null 2>&1 &&
  git -C "${HOME}/.dotfiles" pull --recurse-submodules >/dev/null 2>&1
fi
