# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if [ -d ~/.git-fuzzy ] && command -- fzf -h > /dev/null 2>&1 ; then
  git -C ~/.git-fuzzy pull > /dev/null 2>&1
  export PATH="$PATH:$HOME/.git-fuzzy/bin"
fi
[ -d /var/lib/snapd/snap/bin ] && export PATH="$PATH:/var/lib/snapd/snap/bin"
[ ! -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin"
if command -- pass -h > /dev/null 2>&1 ; then
  export PASSWORD_STORE_ENABLE_EXTENSIONS=true
fi
if command -- fasd -h > /dev/null 2>&1 ; then
  eval "$(fasd --init auto)"
fi

[ -d "${HOME}/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin" ] \
  && export PATH="$PATH:${HOME}/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin"
export PATH="${PATH}:${HOME}/.local/bin"

if ! command -- vim -h > /dev/null 2>&1 ; then
  if command -- nvim -h > /dev/null 2>&1 ; then
    alias vim="nvim"
  fi
fi
if command -- nvim -h > /dev/null 2>&1 ; then
  export EDITOR="nvim"
elif command -- vim -h > /dev/null 2>&1 ; then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi
export VISUAL="$EDITOR"