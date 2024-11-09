#!/usr/bin/env bash

# # find /tmp -user $(id -un) -readable -writable -name 'cursor.*' -type f -print -delete 2>/dev/null
# cursor() {
#   # "$(command -v "cursor")" --no-sandbox "$@" &>"$( mktemp /tmp/cursor.XXXXX)" &
#   nohup "$(command -v cursor)" --no-sandbox "$@" &>/dev/null &
#   disown
# }
