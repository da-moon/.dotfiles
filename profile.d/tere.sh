#!/usr/bin/env bash
tere() {
  local result=$(command tere "$@")
  [ -n "$result" ] && cd -- "$result"
}
