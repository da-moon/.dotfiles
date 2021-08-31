# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if command -- sk --version > /dev/null 2>&1; then
  if command -- rg --version > /dev/null 2>&1; then
    # uses skim and bat to enable quick search an preview of 
    # files in directory tree
    # f(fuzzy)p(preview)
    if command -- bat --version > /dev/null 2>&1; then
      function fp {
        rg --files $1 | sk --preview="bat {} --color=always --style=grid,numbers"
      }
    fi
    # run text search with ripgrep interactively
    # f(fuzzy)s(search)
    function fs {
      sk -i -c "rg {} --color=always $1" --ansi
    }
  fi
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to skim.
_sk_comprun() {
  local command=$1
  shift
  case "$command" in
    cd) sk "$@" --preview 'tree -C {} | head -200' ;;
    export | unset) sk "$@" --preview "eval 'echo \$'{}" ;;
    ssh) sk "$@" --preview 'dig {}' ;;
    *) sk "$@" ;;
  esac
}
fi
if command -- fzf -h > /dev/null 2>&1; then
  fzf_history() {
    local res=$(history | awk '{$1=""; print}' | sort | uniq | fzf)
    READLINE_LINE=$res
    READLINE_POINT=${#res}
  }
  if command -- fasd -h > /dev/null 2>&1 ; then
    fzf_cd() {
      local res=$(fasd -d | sort -rn | cut -c 12- | fzf)
      if [ -n "$res" ]; then
        cd $res
      else
        return 1
      fi
    }
  fi
fi

