# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
alias count='find . -type f | wc -l'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -pv'
alias own='sudo chown -R "$(id -u):$(id -g)"'
alias mount='mount | column -t'
# pass options to free
alias meminfo='free -m -l -t' 
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias df='df -H'
alias du='du -ch'
command -- trash -h > /dev/null 2>&1 && alias rm='trash'
if command -- exa -h > /dev/null 2>&1 ; then
  alias ls="exa"
  alias ll="exa -lhF"
  alias la="exa -alhF"
  alias llfu='exa -bghHliS --git'
  alias llt='exa -T'
fi
if command -- bat -h > /dev/null 2>&1 ; then
  alias cat="bat -pp"
fi
if command -- rsync -h > /dev/null 2>&1 ; then
  alias cpv='rsync -ah --info=progress2'
fi
