#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
function alpine {
  if command -- brl -h > /dev/null 2>&1 ; then
    strat "--restrict" "alpine" "${@}"
  fi
}
function apk {
  if command -- apk -h > /dev/null 2>&1 ; then
    if command -- sudo -h > /dev/null 2>&1 ; then
      command -- sudo apk "${@}"
    fi
  else 
    alpine "apk" "${@}"
  fi
}
