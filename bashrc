#
# ~/.bashrc
#
# If not running interactively, don't do anything
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
HISTFILESIZE=10000000
PROMPT_COMMAND="history -a"
export TERM="xterm-256color"
if grep -qEi "(Microsoft|WSL)" /proc/version &>/dev/null; then
  # [ NOTE ] ensure windows paths are removed
  shopt -s extglob
  export PATH=${PATH//mnt*([^ ])?( )/}
fi
# shellcheck disable=SC1091
[ -r "/usr/share/bash-completion/bash_completion" ] && source "/usr/share/bash-completion/bash_completion"
# shellcheck disable=1090
[ -d "${HOME}/.env.d" ] && while read -r i; do source "$i"; done < <(find "${HOME}/.env.d/" -name '*.sh')
# shellcheck disable=1090
[ -d "${HOME}/.env.d.local" ] && while read -r i; do source "$i"; done < <(find "${HOME}/.env.d.local/" -name '*.sh')
# shellcheck disable=1090
[ -d "${HOME}/.profile.d" ] && while read -r i; do source "$i"; done < <(find "${HOME}/.profile.d/" -name '*.sh')
# shellcheck disable=1090
[ -d "${HOME}/.profile.d.local" ] && while read -r i; do source "$i"; done < <(find "${HOME}/.profile.d.local/" -name '*.sh')
if ( [ -z "${TERM_PROGRAM+x}" ] && [ -z "${TERM_PROGRAM}" ] ) \
  && ( [ -z "${VIMRUNTIME+x}" ] && [ -z "${VIMRUNTIME}" ] ) \
  && ( [ -z "${VIMRUNTIME+x}" ] && [ -z "${VIMRUNTIME}" ] ) \
  && ([ -z "${SOMMELIER_VERSION+x}" ] || [ -z "${SOMMELIER_VERSION}" ]); then
  if command -- colorscript -h >/dev/null 2>&1; then
    color_scripts=(
      "3" "9" "14" "15" "16" "17" "21" "22" "23" "24" "27" "28" "29" "30"
      "31" "34" "36" "39" "41" "42" "44" "45" "46" "47" "48"
    )
    colorscript -e "${color_scripts[RANDOM % ${#color_scripts[@]}]}"
  fi
  if [ ! -r "/tmp/$(date -u +%Y-%m-%d).lock" ]; then
    touch "/tmp/$(date -u +%Y-%m-%d).lock"
    if command -- pmm -h >/dev/null 2>&1; then
      sudo pmm -Syyu --noconfirm
    else
      if command -- pacman -h >/dev/null 2>&1; then
        sudo pacman -Syyu --noconfirm
        if command -- aura -h >/dev/null 2>&1; then
          sudo aura -Ayyuxac --noconfirm --skipinteg --skippgpcheck
        elif command -- paru -h >/dev/null 2>&1; then
          paru -Syyu --removemake --cleanafter --noconfirm
        fi
      fi
      if command -- apt-get -h >/dev/null 2>&1; then
        for i in {1..5}; do
          (
            sudo apt-get update \
            && sudo apt-get upgrade -y --allow-downgrades \
            && sudo apt-get autoremove -y --purge;
          ) && break \
          || sleep 15
        done
      fi
    fi
    # ─────────────────────────────────────────────────────────────────────
    [ -n "$(which node 2>/dev/null)" ] && [ -r "$(which node 2>/dev/null)" ] && sudo chmod a+x "$(which node)"
    [ -n "$(which yarn 2>/dev/null)" ] && [ -r "$(which yarn 2>/dev/null)" ] && sudo chmod a+x "$(which yarn)"
    # ─────────────────────────────────────────────────────────────────────
    if jq --version >/dev/null 2>&1 && "$(which node)" --version >/dev/null 2>&1 && "$(which yarn)" --version >/dev/null 2>&1; then
      if [ -r "$(sudo yarn global dir)/package.json" ]; then
        # [ NOTE ] return should never get called
        # i just added it to stop shellcheck from complaining
        pushd "$(sudo yarn global dir)" >/dev/null 2>&1 || return
        yarn outdated --json 2>/dev/null |
          jq -r '. | select (.type == "table").data.body[]|.[]' \
          | "/bin/grep" \
            -Pv '^([0-9]+)\.([0-9]+)\.([0-9]+)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+[0-9A-Za-z-]+)?$' \
          | "/bin/grep" -Pv '^http(s)*:\/\/|^dependencies$' \
          | sudo xargs -r -I {} \
            yarn global add --latest --prefix "/usr/local" {}
        # [ NOTE ] exit should never get called
        # i just added it to stop shellcheck from complaining
        popd >/dev/null 2>&1 || return
      fi
    # YARN="/bin/bash $(which yarn)"
    # if [ ! -r "/usr/share/yarn/bin/yarn" ];then
    #   YARN="$(which node) $(which yarn)"
    # fi
    # if [ -r "$(sudo "${YARN}" global dir)/package.json" ] ; then
    #   pushd "$(sudo "${YARN}" global dir)" > /dev/null 2>&1
    #   "${YARN}" outdated --json 2>/dev/null \
    #   | jq -r '. | select (.type == "table").data.body[]|.[]' \
    #   | /bin/grep \
    #     -Pv '^([0-9]+)\.([0-9]+)\.([0-9]+)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+[0-9A-Za-z-]+)?$' \
    #   | /bin/grep -Pv '^http(s)*:\/\/|^dependencies$' \
    #   | sudo xargs -r -I {} "${YARN}" global add --latest --prefix /usr/local {}
    #   popd > /dev/null 2>&1
    # fi
    fi
    if command -- python3 -m pip -h >/dev/null 2>&1; then
      python3 -m pip list --user --outdated --format=freeze \
        | "/bin/grep" -v '^\-e' \
        | cut -d = -f 1 \
        | xargs -r -n1 \
          python3 -m pip install \
            --user \
            --upgrade \
            --quiet \
            --progress-bar ascii 2>/dev/null ;
    fi
    if command -- cargo -h >/dev/null 2>&1; then
      if ! command -- cargo-install-update -h >/dev/null 2>&1; then
        rustup run stable --install cargo install --all-features cargo-update
      fi
      if command -- cargo-install-update -h >/dev/null 2>&1; then
        rustup run --install stable cargo-install-update install-update --all \
        || rustup run --install nightly cargo-install-update install-update --all
      fi
    fi
  fi
  if command -- freshfetch -h >/dev/null 2>&1; then
  freshfetch 2>/dev/null
  fi
fi
# shellcheck disable=1090
[ -d "${HOME}/.alias.d" ] && while read -r i; do source "$i"; done < <(find "${HOME}/.alias.d/" -name '*.sh')
# shellcheck disable=1090
[ -d "${HOME}/.alias.d.local" ] && while read -r i; do source "$i"; done < <(find "${HOME}/.alias.d.local/" -name '*.sh')

if command -- starship -h >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi
if command -- rustup -h >/dev/null 2>&1; then
  eval "$(rustup completions bash rustup)"
  eval "$(rustup completions bash cargo)"
fi
export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

