#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# https://github.com/dweidner/dotfiles/blob/main/shell/utilities.sh
# https://ivergara.github.io/Supercharging-shell.html
# https://github.com/farisachugthai/dotfiles/blob/master/unix/.bashrc.d/fzf.bash
function passfor() {
  if pass -c "${1}" && [[ "$(pass show "${1}" | grep -c "^otpauth:")" -eq 1 ]]; then
    read -s -r -p "  Press enter for otp"
    echo ""
    pass otp -c "${1}"
  fi
}
function _fzf_complete_pass() {
  FZF_COMPLETION_TRIGGER="" _fzf_complete "-1" "${@}" < <(
    local PASS_DIR=${PASSWORD_STORE_DIR:-${HOME}/.password-store}
    find "${PASS_DIR}" -name "*.gpg" -print | sed -e "s|${PASS_DIR}/\(.*\)\.gpg$|\1|"
  )
}
function _fzf_complete_make() {
  # From https://unix.stackexchange.com/a/230050
  FZF_COMPLETION_TRIGGER="" _fzf_complete "-1" "${@}" < <(make -pqr 2>/dev/null | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}' | grep -v Makefile | sort -u)
}
function _fzf_preview_textfile {
  local FILE="${1%:*}" LINE= START=0 OFF= END=
  case "$1" in
    *':'*)
      LINE="${1##*:}"
      OFF=$((LINES / 3 + 1))
      START=$((LINE > OFF ? LINE - OFF : 0))
      END=$((LINE + 100))
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
      elif   type tree >/dev/null; then
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
# Preview a text file
export -f _fzf_preview_textfile
export -f _fzf_complete_pass
export -f _fzf_complete_make
export -f _fzf_preview_textfile
export -f _fzf_preview_fs

if [ -r "${HOME}/.fzf/bin/fzf" ]; then
  if [[ ! "$PATH" == *"${HOME}/.fzf/bin}"* ]]; then
    PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
  fi
fi

if [ -x "$(command -v fzf)" ]; then
  if [ -r "/usr/share/bash-completion/bash_completion" ] && [ -d "/usr/share/bash-completion/completions" ]; then
    [ -r "/usr/share/fzf/key-bindings.bash" ] && source "/usr/share/fzf/key-bindings.bash"
    [ -r "/usr/share/fzf/completion.bash" ] && source "/usr/share/fzf/completion.bash"
    [ -r "/usr/share/fzf/fzf-tab-completion.bash" ] && source "/usr/share/fzf/fzf-tab-completion.bash"
    if command -v pass >/dev/null 2>&1; then
      [[ -n ${BASH} ]] && complete -F _fzf_complete_pass -o default -o bashdefault pass
      [[ -n ${BASH} ]] && complete -F _fzf_complete_pass -o default -o bashdefault passfor
    fi
    if command -v make >/dev/null 2>&1; then
      [[ -n ${BASH} ]] && complete -F _fzf_complete_make -o default -o bashdefault make
    fi
    bind -x '"\t": fzf_bash_completion'
    if command -- fd -h >/dev/null  2>&1; then
      excludes="--exclude .git"
      excludes="${excludes} --exclude .vagrant"
      excludes="${excludes} --exclude .vagrant.d "
      excludes="${excludes} --exclude node_modules"
      if command -- go version >/dev/null  2>&1; then
        excludes="${excludes} --exclude $(go env GOPATH | sed -e "s/\/home\/$USER\///g")/pkg"
      fi
       FZF_BASE_COMMAND="fd --hidden --follow -j $(nproc) --color always ${excludes}"
       FZF_ALT_C_COMMAND="${FZF_BASE_COMMAND} --type d"
       FZF_CTRL_T_COMMAND="${FZF_BASE_COMMAND} --type f --max-depth 6"
      export FZF_BASE_COMMAND
      export FZF_ALT_C_COMMAND
      export FZF_CTRL_T_COMMAND
    fi
    FZF_DEFAULT_OPTS="-0"
    FZF_DEFAULT_OPTS+=" --multi"
    FZF_DEFAULT_OPTS+=" --reverse"
    FZF_DEFAULT_OPTS+=" --height=40%"
    FZF_DEFAULT_OPTS+=" --tabstop=2"
    FZF_DEFAULT_OPTS+=" --prompt=' │ '"
    FZF_DEFAULT_OPTS+=" --color='prompt:0,hl:178,hl+:178'"
    # FZF_DEFAULT_OPTS+=" --bind='ctrl-t:toggle-all,ctrl-g:select-all+accept'"
    FZF_DEFAULT_OPTS+=" --bind='tab:ignore'"
    FZF_DEFAULT_OPTS+=" --bind='shift-tab:ignore'"
    FZF_DEFAULT_OPTS+=" --bind='ctrl-t:ignore'"
    FZF_DEFAULT_OPTS+=" --bind='ctrl-g:ignore'"
    FZF_DEFAULT_OPTS+=" --bind='right:toggle+down'"
    FZF_DEFAULT_OPTS+=" --bind='left:toggle+up'"
    FZF_DEFAULT_OPTS+=" --bind='ctrl-space:select-all'"
    FZF_DEFAULT_OPTS+=" --bind='alt-space:deselect-all'"
    FZF_DEFAULT_OPTS+=" --bind='?:toggle-preview'"
    FZF_CTRL_T_OPTS='--multi'
    FZF_CTRL_T_OPTS+=' --cycle'
    FZF_CTRL_T_OPTS+=' --border '
    FZF_CTRL_T_OPTS+=' --reverse'
    FZF_CTRL_T_OPTS+=' --ansi'
    FZF_CTRL_T_OPTS+=' --filepath-word'
    FZF_CTRL_T_OPTS+=' --tiebreak="begin,length,index"'
    FZF_CTRL_T_OPTS+=' --header "Press ? to toggle preview."'
    FZF_CTRL_T_OPTS+=' --prompt "FZF File Finder"'
    FZF_CTRL_T_OPTS+=' --preview="_fzf_preview_fs {}"'
    FZF_CTRL_T_OPTS+=' --bind "?:toggle-preview"'
    FZF_CTRL_T_OPTS+=' --bind ctrl-e:execute:"${EDITOR} {}"'
    FZF_CTRL_T_OPTS+=' --bind change:top'
    # FZF_CTRL_T_OPTS+=' --bind=ctrl-j:accept'
    # FZF_CTRL_T_OPTS+=' --bind=ctrl-k:kill-line'
    FZF_ALT_C_OPTS='-1'
    FZF_ALT_C_OPTS+=' -0'
    FZF_ALT_C_OPTS+=' --no-multi'
    FZF_ALT_C_OPTS+=' --cycle'
    FZF_ALT_C_OPTS+=' --border '
    FZF_ALT_C_OPTS+=' --reverse'
    FZF_ALT_C_OPTS+=' --ansi'
    FZF_ALT_C_OPTS+=' --filepath-word'
    FZF_ALT_C_OPTS+=' --tiebreak="begin,length,index"'
    FZF_ALT_C_OPTS+=' --header "Press ? to toggle preview."'
    FZF_ALT_C_OPTS+=' --prompt "FZF Dir Finder"'
    FZF_ALT_C_OPTS+=' --bind "?:toggle-preview"'
    FZF_ALT_C_OPTS+=' --preview="_fzf_preview_fs {}"'
    # Bash history and completion
    FZF_CTRL_R_OPTS="--preview='echo {}'"
    FZF_CTRL_R_OPTS+=" --preview-window='down:5:wrap'"
    FZF_COMPLETION_TRIGGER='@'
    export FZF_DEFAULT_OPTS
    export FZF_CTRL_T_OPTS
    export FZF_ALT_C_OPTS
    export FZF_CTRL_R_OPTS
    export FZF_COMPLETION_TRIGGER
  fi
fi
