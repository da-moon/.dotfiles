# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# https://github.com/dweidner/dotfiles/blob/main/shell/utilities.sh
# https://ivergara.github.io/Supercharging-shell.html
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
      if [ ! -r "/usr/share/fzf/fzf-tab-completion.bash" ] ; then
        sudo wget -qO "/usr/share/fzf/fzf-tab-completion.bash" "https://raw.githubusercontent.com/lincheney/fzf-tab-completion/master/bash/fzf-bash-completion.sh" 2>/dev/null
      fi
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
    source "/usr/share/fzf/key-bindings.bash"
    source "/usr/share/fzf/completion.bash"
    source "/usr/share/fzf/fzf-tab-completion.bash"
    bind -x '"\t": fzf_bash_completion'
  fi
fi
