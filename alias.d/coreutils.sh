#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
command -- trash -h > /dev/null 2>&1 && alias rm='trash'
if command -- exa -h > /dev/null 2>&1 ; then
  alias llfu='exa -bghHliS --git'
fi
if command -- lsd -h > /dev/null 2>&1 ; then
  alias ls="lsd"
  alias ll="lsd -lhF"
  alias la="lsd -alhF"
  alias llfu='exa -bghHliS --git'
  alias llt='lsd -T'
fi

if command -- bat -h > /dev/null 2>&1 ; then
  alias cat="bat -pp"
fi
if command -- rsync -h > /dev/null 2>&1 ; then
  alias cpv='rsync -ah --info=progress2'
fi
if command -- et -h > /dev/null 2>&1 ; then
  # used in combination with eternal terminal
  alias ssh-et='ssh -Y -m "hmac-sha2-512" -i "${HOME}/.ssh/id_rsa" -L "6666:localhost:6666" -L "2489:localhost:2489" -o "IdentitiesOnly=yes" -o "StrictHostKeyChecking=no" -o "CheckHostIP=no" -o "UserKnownHostsFile=/dev/null" -p 6010'
fi
# ─────────────────────────────────────────────────────────────────────
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
alias top-cpu='ps -eo pcpu,pid,user,args | sort -k1 -r -n | head -10'
