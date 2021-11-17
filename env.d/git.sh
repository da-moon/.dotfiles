# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if command -- fzf -h > /dev/null 2>&1 ; then
  [ ! -d "${HOME}/.git-fuzzy" ] && git clone "https://github.com/bigH/git-fuzzy" "${HOME}/.git-fuzzy" ;
  git -C "${HOME}/.git-fuzzy" pull > /dev/null 2>&1 ;
  [ -d "${HOME}/.git-fuzzy/bin" ] && export PATH="$PATH:${HOME}/.git-fuzzy/bin" ;

  [ ! -d "${HOME}/.forgit" ] && git clone "https://github.com/wfxr/forgit" "${HOME}/.forgit" ;
  git -C "${HOME}/.forgit" pull > /dev/null 2>&1 ;
  [ -d "${HOME}/.forgit/bin" ] && export PATH="$PATH:${HOME}/.forgit/bin" ;
  [ -r "${HOME}/.forgit/forgit.plugin.zsh" ] && source "${HOME}/.forgit/forgit.plugin.zsh";
fi
