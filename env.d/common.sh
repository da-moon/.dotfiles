if [ -d ~/.git-fuzzy ] && command -- fzf -h > /dev/null 2>&1 ; then
  git -C ~/.git-fuzzy pull > /dev/null 2>&1
  export PATH="$PATH:$HOME/.git-fuzzy/bin"
fi
[ -d /var/lib/snapd/snap/bin ] && export PATH="$PATH:/var/lib/snapd/snap/bin"
[ ! -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin"
export PATH="${PATH}:${HOME}/.local/bin"
export HISTFILESIZE=10000
export PROMPT_COMMAND="history -a && history -c && sort ~/.bash_history | uniq > ~/.bash_history_new && rm ~/.bash_history && mv ~/.bash_history_new ~/.bash_history && history -r"
