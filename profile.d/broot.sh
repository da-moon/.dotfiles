#!/usr/bin/env bash

if broot --version >/dev/null  2>&1; then
  eval "$(broot --print-shell-function bash)"
fi
