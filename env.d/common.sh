if [ -d ~/.git-fuzzy ] && command -- fzf -h > /dev/null 2>&1 ; then
  git -C ~/.git-fuzzy pull > /dev/null 2>&1
  export PATH="$PATH:$HOME/.git-fuzzy/bin"
fi
[ -d /var/lib/snapd/snap/bin ] && export PATH="$PATH:/var/lib/snapd/snap/bin"
[ ! -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin"
if command -- pass -h > /dev/null 2>&1 ; then
  export PASSWORD_STORE_ENABLE_EXTENSIONS=true
fi
[ -d "${HOME}/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin" ] \
  && export PATH="$PATH:${HOME}/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin"
export PATH="${PATH}:${HOME}/.local/bin"

