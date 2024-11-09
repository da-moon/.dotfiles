#

# ~/.bashrc
#
# # If not running interactively, don't do anything
# set -x
# # Store the original PS4 value
# OLD_PS4=$PS4

# export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
# # Set PS4 to include script name and line number
[[ $- != *i* ]] && return
case "$0" in
-bash | bash | */bash) ;;
-sh | sh | */sh) ;;

*) return ;;
esac
[ -z "$HOME" ] && export HOME="/home/$(id -un)"
# [[ $- != *i* && $0 != "-bash" && $0 != "-sh" ]] && return
# ────────────────────────────────────────────────────────────────────────────────
PS1='[\u@\h \W]\$ '
HISTFILESIZE=1000000000
PROMPT_COMMAND="history -a"
export TERMINFO="/usr/share/terminfo"
export TERM="xterm-256color"
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export PASSWORD_STORE_GPG_OPTS='--no-tty --batch'
if grep -qEi "(Microsoft|WSL)" /proc/version &>/dev/null; then
  # [ NOTE ] ensure windows paths are removed
  shopt -s extglob
  export PATH=${PATH//mnt*([^ ])?( )/}
fi
# shellcheck disable=SC1091
[ -r "/usr/share/bash-completion/bash_completion" ] && source "/usr/share/bash-completion/bash_completion"
[ -r "${HOME}/.bash_functions" ] && source "${HOME}/.bash_functions"
[ -r "${HOME}/.environment" ] && source "${HOME}/.environment"
[ -r "${HOME}/.bash_aliases" ] && source "${HOME}/.bash_aliases"
# # ─────────────────────────────────────────────────────────────────────
# # if ( [ -z "${TERM_PROGRAM+x}" ] && [ -z "${TERM_PROGRAM}" ] ) \
# #   && ( [ -z "${VIMRUNTIME+x}" ] && [ -z "${VIMRUNTIME}" ] ) \
# #   && ( [ -z "${VIMRUNTIME+x}" ] && [ -z "${VIMRUNTIME}" ] ) \
# #   && ([ -z "${SOMMELIER_VERSION+x}" ] || [ -z "${SOMMELIER_VERSION}" ]); then
# #   if command -- colorscript -h >/dev/null 2>&1; then
# #     color_scripts=(
# #       "3" "9" "14" "15" "16" "17" "21" "22" "23" "24" "27" "28" "29" "30"
# #       "31" "34" "36" "39" "41" "42" "44" "45" "46" "47" "48"
# #     )
# #     colorscript -e "${color_scripts[RANDOM % ${#color_scripts[@]}]}"
# #   fi
# #   # if command -- freshfetch -h >/dev/null 2>&1; then
# #   # freshfetch 2>/dev/null
# #   # fi
# # fi
export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')
# ────────────────────────────────────────────────────────────────────────────────
function refresh-rc() {
  sudo find ~/ -xtype l -delete
  echo "#!/usr/bin/env bash" >"${HOME}/.environment"
  [ -d "${HOME}/.env.d" ] && while read -r i; do
    sed -e '/^\s*#/d' "$i" | tee -a "${HOME}/.environment" >/dev/null \
      && printf "\n" >>"${HOME}/.environment"
  done < <(find "${HOME}/.env.d/" -name '*.sh' -readable)

  [ -d "${HOME}/.env.d.local" ] && while read -r i; do
    sed -e '/^\s*#/d' "$i" | tee -a "${HOME}/.environment" >/dev/null \
      && printf "\n" >>"${HOME}/.environment"
  done < <(find "${HOME}/.env.d.local/" -name '*.sh' -readable)

  echo "#!/usr/bin/env bash" >"${HOME}/.bash_functions"
  [ -d "${HOME}/.profile.d" ] && while read -r i; do
    sed -e '/^\s*#/d' "$i" | tee -a "${HOME}/.bash_functions" >/dev/null \
      && printf "\n" >>"${HOME}/.bash_functions"
  done < <(find "${HOME}/.profile.d/" -name '*.sh' -readable)

  [ -d "${HOME}/.profile.d.local" ] && while read -r i; do
    sed -e '/^\s*#/d' "$i" | tee -a "${HOME}/.bash_functions" >/dev/null \
      && printf "\n" >>"${HOME}/.bash_functions"
  done < <(find "${HOME}/.profile.d.local/" -name '*.sh' -readable)

  echo "#!/usr/bin/env bash" >"${HOME}/.bash_aliases"
  [ -d "${HOME}/.alias.d" ] && while read -r i; do
    sed -e '/^\s*#/d' -e 's/^\s+//g' "$i" | tee -a "${HOME}/.bash_aliases" >/dev/null \
      && printf "\n" >>"${HOME}/.bash_aliases"
  done < <(find "${HOME}/.alias.d/" -name '*.sh' -readable)

  [ -d "${HOME}/.alias.d.local" ] && while read -r i; do
    sed -e '/^\s*#/d' "$i" | tee -a "${HOME}/.bash_aliases" >/dev/null \
      && printf "\n" >>"${HOME}/.bash_aliases"
  done < <(find "${HOME}/.alias.d.local/" -name '*.sh' -readable)
  source "${HOME}/.environment"
  source "${HOME}/.bash_functions"
  source "${HOME}/.bash_aliases"
}
function refresh-x() {
  rm -f "${HOME}/.Xresources"
  [ -d "${HOME}/.Xresources.d" ] && while read -r i; do
    echo "#include \"$i\"" >>"${HOME}/.Xresources"
  done < <(find "${HOME}/.Xresources.d" -name '*.Xresources')
  xrdb -merge "${HOME}/.Xresources"
  if command -- i3 -h >/dev/null 2>&1; then
    if [ -d ~/.config/regolith/i3.d ]; then
      mkdir -p ~/.config/regolith/i3
      rm -f ~/.config/regolith/i3/config
      while read i; do
        cat $i >>~/.config/regolith/i3/config
      done < <(find ~/.config/regolith/i3.d -name '*.i3')
      sed -i -e '/^\s*$/d' -e '/^\s*#/d' ~/.config/regolith/i3/config
    fi
  fi
}
