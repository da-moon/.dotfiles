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
if ! command -- vim -h > /dev/null 2>&1 ; then
  if command -- nvim -h > /dev/null 2>&1 ; then
    alias vim="nvim"
  fi
fi
if command -- nvim -h > /dev/null 2>&1 ; then
  alias nvim='nvim --headless +"call dein#recache_runtimepath()" +qall && nvim'
fi
if command -- netstat -h > /dev/null 2>&1 ; then
  alias ports='netstat -tulanp'
fi
if command -- sk -h > /dev/null 2>&1 ; then
  alias skm='sk -m'
  alias skf="${SKIM_DEFAULT_COMMAND} | sk"
  alias skvi='nvim $(skfi)'
fi
if command -- fzf -h > /dev/null 2>&1; then
  alias h='fzf_history'
  if command -- fasd -h > /dev/null 2>&1 ; then
    alias c='fzf_cd'
  fi
fi
