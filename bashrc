#
# ~/.bashrc
#
# If not running interactively, don't do anything
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
HISTFILESIZE=1000000
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
if [ -z "${TERM_PROGRAM+x}" ] &&
  [ -z "${TERM_PROGRAM}" ] &&
  [ -z "${SOMMELIER_VERSION}" ] &&
  [[ -z "$(printenv | grep VIM)" ]]; then
  if command -- colorscript -h >/dev/null 2>&1; then
    color_scripts=(
      "3"
      "9"
      "14"
      "15"
      "16"
      "17"
      "21"
      "22"
      "23"
      "24"
      "27"
      "28"
      "29"
      "30"
      "31"
      "34"
      "36"
      "39"
      "41"
      "42"
      "44"
      "45"
      "46"
      "47"
      "48"
    )
    colorscript -e "${color_scripts[RANDOM % ${#color_scripts[@]}]}"
  fi
  if [ ! -r "/tmp/$(date -u +%Y-%m-%d).lock" ]; then
    touch "/tmp/$(date -u +%Y-%m-%d).lock"
    if command -- sudo -h >/dev/null 2>&1; then
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
            ( \
              sudo apt-get update \
              && sudo apt-get upgrade -y --allow-downgrades \
              && sudo apt-get autoremove -y --purge \
            ) && break \
            || sleep 15;
          done
        fi
      fi
      if command -- jq --version >/dev/null 2>&1 &&
        command -- "$(which node)" --version >/dev/null 2>&1 &&
        command -- "$(which yarn)" --version >/dev/null 2>&1; then
        if [ -r "$(sudo yarn global dir)/package.json" ]; then
          # [ NOTE ] return should never get called
          # i just added it to stop shellcheck from complaining
          pushd "$(sudo yarn global dir)" >/dev/null 2>&1 || return
          yarn outdated --json 2>/dev/null |
            jq -r '. | select (.type == "table").data.body[]|.[]' |
            /bin/grep \
              -Pv '^([0-9]+)\.([0-9]+)\.([0-9]+)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+[0-9A-Za-z-]+)?$' |
            /bin/grep -Pv '^http(s)*:\/\/|^dependencies$' |
            sudo xargs -r -I {} yarn global add --latest --prefix /usr/local {}
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
        python3 -m pip list --user --outdated --format=freeze |
          /bin/grep -v '^\-e' |
          /bin/cut -d = -f 1 |
          xargs -r -n1 python3 -m pip install --user -U -q --progress-bar ascii --no-cache-dir 2>/dev/null
      fi
    fi
    if command -- cargo -h >/dev/null 2>&1; then
      if ! command -- cargo-install-update -h >/dev/null 2>&1; then
        rustup run stable --install cargo install --all-features cargo-update
      fi
      if command -- cargo-install-update -h >/dev/null 2>&1; then
        (rustup default stable &&
          cargo-install-update install-update --all) ||
          (rustup default nightly &&
            cargo-install-update install-update --all &&
            rustup default stable)
      fi
    fi
    # [ NOTE ] => merge xresources and i3 config once per login
    [ -d "${HOME}/.dotfiles" ] &&
      git -C "${HOME}/.dotfiles" submodule update --init --recursive >/dev/null 2>&1 &&
      git -C "${HOME}/.dotfiles" pull --recurse-submodules >/dev/null 2>&1
    if command -- xrdb -version >/dev/null 2>&1; then
      if [ -d "${HOME}/.Xresources.d" ]; then
        rm -f "${HOME}/.Xresources"
        while read -r i; do
          echo "#include \"$i\"" >>"${HOME}/.Xresources"
        done < <(find "${HOME}/.Xresources.d" -name '*.Xresources')
        xrdb -merge "${HOME}/.Xresources"
      fi
    fi
    if command -- i3 -h >/dev/null 2>&1; then
      if [ -d "${HOME}/.i3.d" ]; then
        mkdir -p "${HOME}/.config/regolith/i3"
        rm -f "${HOME}/.config/regolith/i3/config"
        while read -r i; do
          cat "${i}" >> "${HOME}/.config/regolith/i3/config"
        done < <(find "${HOME}/.config/regolith/i3.d" -name '*.i3')
        sed -i -e '/^\s*$/d' -e '/^\s*#/d' "${HOME}/.config/regolith/i3/config"
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
[ ! -r "${HOME}/.ssh/known_hosts" ] && touch "${HOME}/.ssh/known_hosts"
if command -- starship -h >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi
if command -- rustup -h >/dev/null 2>&1; then
  eval "$(rustup completions bash rustup)"
  eval "$(rustup completions bash cargo)"
fi
