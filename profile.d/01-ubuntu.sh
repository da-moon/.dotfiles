# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
function ubuntu {
  if command -- brl -h > /dev/null 2>&1 ; then
    strat "--restrict" "ubuntu" "${@}"
  fi
}
function apt {
  if command -- apt -h > /dev/null 2>&1 ; then
    command -- sudo apt "${@}"
  else 
    ubuntu apt "${@}"
  fi
}
function apt-get {
  if command -- apt-get -h > /dev/null 2>&1 ; then
    command -- sudo apt-get "${@}"
  else 
    ubuntu apt-get "${@}"
  fi
}
