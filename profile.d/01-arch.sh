#!/usr/bin/env bash
function arch {
  if command -- brl -h > /dev/null 2>&1 ; then
    strat "--restrict" "arch" "${@}"
  fi
}
function pacman {
  if command -- pacman -h > /dev/null 2>&1 ; then
    command -- sudo pacman --noconfirm "${@}"
  else 
    arch pacman "--noconfirm" "${@}"
  fi
}
function makepkg {
  if command -- makepkg -h > /dev/null 2>&1 ; then
    command -- makepkg --noconfirm "${@}"
  else
    arch "sudo" "-u" "`whoami`" "bash" "--" "makepkg" "--noconfirm" "${@}"
  fi
}
function paru {
  if command -- paru -h > /dev/null 2>&1 ; then
    command -- paru --noconfirm "${@}"
  else
    # git clone https://aur.archlinux.org/paru.git /tmp/paru
    # pushd /tmp/paru
    # makepkg "-sic" "--noconfirm"
    # popd
    # sudo rm -rf /tmp/paru
    arch "sudo" "-u" "`whoami`" "bash" "--" "paru" "--noconfirm" "${@}"
  fi
}

# alias aur='read -s -p "pkg: " pkg; rm -rf "/tmp/$pkg" ; git clone  "https://aur.archlinux.org/$pkg.git" "/tmp/$pkg" ; pushd "/tmp/$pkg"; makepkg -sic --noconfirm ; popd ; sudo rm -rf "/tmp/$pkg"; unset $pkg'