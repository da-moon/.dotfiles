#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
command -- trash -h >/dev/null  2>&1 && alias rm='trash'

if command -- bat -h >/dev/null  2>&1; then
  alias cat="bat -pp"
fi
if command -- rsync -h >/dev/null  2>&1; then
  alias cpv='rsync -ah --info=progress2'
fi
if command -- et -h >/dev/null  2>&1; then
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
alias compare_basename_lists='f(){ dir1="$1"; dir2="$2"; pattern="${3:-*.sh}"; tmp1="$(mktemp /tmp/compare_basename_lists.XXXXXX)"; tmp2="$(mktemp /tmp/compare_basename_lists.XXXXXX)"; find "$dir1" -type f -name "$pattern" -print0 | while IFS= read -r -d "" file; do basename "$file"; done | sort > "$tmp1"; find "$dir2" -type f -name "$pattern" -print0 | while IFS= read -r -d "" file; do basename "$file"; done | sort > "$tmp2"; comm -23 "$tmp1" "$tmp2"; rm -f "$tmp1" "$tmp2";}; f "$@"'
