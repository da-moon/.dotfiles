#!/usr/bin/env bash

function brl {
  if command -- brl -h > /dev/null 2>&1 ; then
    command -- sudo brl "${@}"
  fi
}
function strat {
  if command -- brl -h > /dev/null 2>&1 ; then
    brl "strat" "--restrict" "${@}"
  fi
}
# alias brlpin='set -x;read -p "name: " name;read -p "stratum: " stratum;strat -r $stratum which $name > /dev/null 2>&1 && sudo sed -i -e "/$name/d" -e "/^\s*\[cross-bin\]\s*$/a pin/bin/$name = $stratum:$(strat -r $stratum which $name)" -e "/^\s*\[restriction\]\s*$/a pin/bin/$name = $stratum:$(strat -r $stratum which $name)" /bedrock/etc/bedrock.conf ;unset $name; unset $stratum;set +x'