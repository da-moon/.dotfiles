#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# https://github.com/dweidner/dotfiles/blob/main/shell/utilities.sh
# https://ivergara.github.io/Supercharging-shell.html
# https://github.com/farisachugthai/dotfiles/blob/master/unix/.bashrc.d/fzf.bash
if command -- fzf -h > /dev/null 2>&1; then
  if [ -r "/usr/share/bash-completion/bash_completion" ] && [ -d "/usr/share/bash-completion/completions" ]; then
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
    source "/usr/share/fzf/key-bindings.bash"
    source "/usr/share/fzf/completion.bash"
    # Preview a text file
    function _fzf_preview_textfile {
      local FILE="${1%:*}" LINE= START=0 OFF= END=
      case "$1" in
        *':'*)
          LINE="${1##*:}"
          OFF=$(( LINES / 3 + 1 ))
          START=$(( LINE>OFF ? LINE-OFF : 0 ))
          END=$(( LINE + 100 ))
          ;;
      esac
      {
        if type bat >/dev/null && false; then
          local LN=()
          [ -n "$LINE" ] && LN=("-r$START:$END" "-H$LINE")
          bat -n --color always --tabs 2 "${LN[@]}" "$FILE"
        else
          cat -n "$FILE" | tail "-n+$START" | head -100
        fi
        "${CMD[@]}" "$FILE"
      } 2>/dev/null
    }
    # Preview a file or a directory
    function _fzf_preview_fs {
      local CRESET=$'\033[0m'
      local CYELLOW=$'\033[0;4;33m'
      local TYPE=$(file -Eib "$1")
      {
        echo "${CYELLOW}Name:$CRESET $1"
        echo "${CYELLOW}Type:$CRESET $TYPE"
        echo "${CYELLOW}Info:$CRESET $(ls -lhdG "$1")"
        echo
        case "$TYPE" in
          'inode/directory'*)
            if type exa >/dev/null; then
              exa -lhF -T "$1"
            elif type tree >/dev/null; then
              tree -C -L 1 -push -a --filelimit 200 "$1"
            else
              ls --color=always -lAh "$1"
            fi
            ;;
          *' charset=binary'*) xxd "$1" ;;
          *) _fzf_preview_textfile "$1" ;;
        esac
      } 2>/dev/null
    }
    export -f _fzf_preview_textfile
    export -f _fzf_preview_fs
    source "/usr/share/fzf/fzf-tab-completion.bash"
    bind -x '"\t": fzf_bash_completion'
  fi
fi