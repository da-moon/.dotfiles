#!/usr/bin/env bash
function arch {
  if command -- brl -h > /dev/null 2>&1 ; then
    strat "--restrict" "arch" "${@}"
  fi
}
function pacman {
  if command -- pacman -h > /dev/null 2>&1 ; then
    command -- sudo pacman "${@}"
  else 
    arch pacman "${@}"
  fi
}
alias aur='read -s -p "pkg: " pkg; rm -rf "/tmp/$pkg" ; git clone  "https://aur.archlinux.org/$pkg.git" "/tmp/$pkg" ; pushd "/tmp/$pkg"; makepkg -sic --noconfirm ; popd ; sudo rm -rf "/tmp/$pkg"; unset $pkg'