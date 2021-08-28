# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if [ -d ~/.git-fuzzy ] && command -- fzf -h > /dev/null 2>&1 ; then
  git -C ~/.git-fuzzy pull > /dev/null 2>&1
  export PATH="$PATH:$HOME/.git-fuzzy/bin"
fi
source <(curl -sSL git.io/forgit)
