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
  if [ -r "/usr/share/bash-completion/bash_completion" ] && [ -d "/usr/share/bash-completion/completions" ]; then
    if [ -z "$(LC_ALL=C type -t _fzf_complete)" ] || [ ! "$(LC_ALL=C type -t _fzf_complete)" = function ]; then
        [ ! -d "/usr/share/fzf" ] && sudo mkdir "/usr/share/fzf"
      if [ ! -r "/usr/share/fzf/key-bindings.bash" ] ; then
        sudo wget -qO "/usr/share/fzf/key-bindings.bash" "https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash" 2>/dev/null
      fi
      if [ ! -r "/usr/share/fzf/completion.bash" ]; then
        sudo wget -qO "/usr/share/fzf/completion.bash" "https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash" 2>/dev/null
      fi
    fi
    source "/usr/share/fzf/key-bindings.bash"
    source "/usr/share/fzf/completion.bash"
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
    if command -v git >/dev/null 2>&1; then
      grip() {
        fzf --ansi --reverse --tiebreak=index --no-sort --no-hscroll --preview 'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1; }; f {}'
      }
    fi
    if command -v pass >/dev/null 2>&1; then
      _fzf_complete_pass() {
        FZF_COMPLETION_TRIGGER="" _fzf_complete "-1" "${@}" < <(
          local PASS_DIR=${PASSWORD_STORE_DIR:-${HOME}/.password-store}
          find "${PASS_DIR}" -name "*.gpg" -print | sed -e "s|${PASS_DIR}/\(.*\)\.gpg$|\1|"
        )
      }
      [[ -n ${BASH} ]] && complete -F _fzf_complete_pass -o default -o bashdefault pass
      passfor() {
        if pass -c "${1}" && [[ "$(pass show "${1}" | grep -c "^otpauth:")" -eq 1 ]]; then
          read -s -r -p "  Press enter for otp"
          echo ""

          pass otp -c "${1}"
        fi
      }
      [[ -n ${BASH} ]] && complete -F _fzf_complete_pass -o default -o bashdefault passfor
    fi

    if command -v make >/dev/null 2>&1; then
      _fzf_complete_make() {
        # From https://unix.stackexchange.com/a/230050
        FZF_COMPLETION_TRIGGER="" _fzf_complete "-1" "${@}" < <(make -pqr 2>/dev/null | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}' | grep -v Makefile | sort -u)
      }
      [[ -n ${BASH} ]] && complete -F _fzf_complete_make -o default -o bashdefault make
    fi

    if command -v ssh >/dev/null 2>&1; then
      _fzf_complete_ssh_notrigger() {
        FZF_COMPLETION_TRIGGER="" _fzf_host_completion
      }
      [[ -n ${BASH} ]] && complete -F _fzf_complete_ssh_notrigger -o default -o bashdefault ssh
    fi
  fi
fi
