# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
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

alias nocmt="sed -e '/#/d' -e '/^[[:space:]]*$/d'"
alias pprintenv="printenv | awk 'BEGIN{FS=OFS=\"=\";}{printf \"%-30s%-18s\n\",\$1,\$2}'"
