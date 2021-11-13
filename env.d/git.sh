# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if [ -d "${HOME}/.git-fuzzy" ] && command -- fzf -h > /dev/null 2>&1 ; then
  git -C "${HOME}/.git-fuzzy" pull > /dev/null 2>&1
  export PATH="$PATH:${HOME}/.git-fuzzy/bin"
fi
if [ ! -r "/etc/profile.d/forgit.sh" ]; then
  curl -sSL "git.io/forgit" | sudo tee "/etc/profile.d/forgit.sh" > /dev/null 
  source "/etc/profile.d/forgit.sh"
fi