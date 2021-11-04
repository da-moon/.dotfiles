# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
alias ..='cd ..'
alias nocmt="sed -e '/#/d' -e '/^[[:space:]]*$/d'"
alias pprintenv="printenv | awk 'BEGIN{FS=OFS=\"=\";}{printf \"%-30s%-18s\n\",\$1,\$2}'"
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date -u +"%Y-%m-%d"'
if command -- aria2c -h > /dev/null 2>&1 ; then
  alias dl="aria2c --optimize-concurrent-downloads -k 1M -j16 -x 16 -c --file-allocation=falloc"
fi
if ! command -- code -h > /dev/null 2>&1 ; then
  if command -- code-insiders -h > /dev/null 2>&1 ; then
    alias code="code-insiders"
  fi
fi
if command -- netstat -h > /dev/null 2>&1 ; then
  alias ports='netstat -tulanp'
fi
if command -- sk -h > /dev/null 2>&1 ; then
  alias skm='sk -m'
  alias skf="${SKIM_DEFAULT_COMMAND} | sk"
  alias skvi='nvim $(skfi)'
fi
if command -- pandoc -h > /dev/null 2>&1; then
  alias md2jira='pandoc --from commonmark --to jira'
  alias md2pdf='pandoc --from markdown --pdf-engine=xelatex'
fi
if command -- kitty -h > /dev/null 2>&1; then
  alias icat="kitty +kitten icat"
fi

alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
#
# ──── FASD ──────────────────────────────────────────────────────────
#

if command -- fasd -h > /dev/null 2>&1 ; then
  # any
  alias a='fasd -a'
  # show / search / select
  alias s='fasd -si'
  # directory
  alias d='fasd -d'
  # file
  alias f='fasd -f'
  # interactive directory selection
  alias sd='fasd -sid'
  # interactive file selection
  alias sf='fasd -sif'
  # cd, same functionality as j in autojump
  alias z='fasd_cd -d'
  # cd with interactive selection
  alias zz='fasd_cd -d -i'
fi

