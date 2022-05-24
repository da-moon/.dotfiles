# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# ─────────────────────────────────────────────────────────────────────
[ ! -d "${HOME}/.local/bin" ] && mkdir -p "${HOME}/.local/bin"
export PATH="${PATH}:${HOME}/.local/bin"

[ ! -d "${HOME}/bin" ] && mkdir -p "${HOME}/.local/bin"
export PATH="${PATH}:${HOME}/bin"
[ -d "/var/lib/snapd/snap/bin" ] && export PATH="$PATH:/var/lib/snapd/snap/bin"
[ -d "/snap" ] && export PATH="$PATH:/snap/bin"
if command -- pass -h > /dev/null 2>&1 ; then
  export PASSWORD_STORE_ENABLE_EXTENSIONS=true
fi
# if command -- fasd -h > /dev/null 2>&1 ; then
#   eval "$(fasd --init auto)"
# fi
# if (command -v perl && command -v cpanm) >/dev/null 2>&1; then
#   test -d "${HOME}/perl5/lib/perl5" && eval $(perl -I "${HOME}/perl5/lib/perl5" -Mlocal::lib)
# fi

[ -d "${HOME}/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin" ] \
  && export PATH="$PATH:${HOME}/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin"
#if ! command -- vim -h > /dev/null 2>&1 ; then
#  if command -- nvim -h > /dev/null 2>&1 ; then
#    alias vim="nvim"
#  fi
#fi
if command -- hx -h > /dev/null 2>&1 ; then
  export EDITOR="hx"
elif command -- nvim -h > /dev/null 2>&1 ; then
  export EDITOR="nvim"
elif command -- vim -h > /dev/null 2>&1 ; then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi
export VISUAL="$EDITOR"
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
export MANPAGER='sh -c "col -bx | '"$(printf "%q" bat)"' --language man --style plain"' ;
