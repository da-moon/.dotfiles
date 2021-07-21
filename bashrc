#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
export EDITOR="nvim"

if [ -z ${TERM_PROGRAM+x} ] || [ -z ${TERM_PROGRAM} ] || [ -z ${TERM_PROGRAM} ]; then
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
    colorscript -e ${color_scripts[RANDOM % ${#color_scripts[@]}]}
  fi
  if [ ! -r /tmp/login.lock ]; then
    touch /tmp/login.lock
    if command -- sudo -h >/dev/null 2>&1; then
      if command -- pmm -h >/dev/null 2>&1; then
        sudo pmm -Syyu --noconfirm
      else
        if command -- pacman -h >/dev/null 2>&1; then
          sudo pacman -Syyu --noconfirm
          if command -- pacman -h >/dev/null 2>&1; then
            paru -Syyu --cleanafter --noconfirm
          fi
        fi
        if command -- apt-get -h >/dev/null 2>&1; then
          sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y --purge
        fi
      fi
      if command -- sudo $(which node) $(which yarn) --help >/dev/null 2>&1; then
        sudo $(which node) $(which yarn) global --silent --prefix /usr/local upgrade
      fi
      if command -- sudo python3 -m pip -h >/dev/null 2>&1; then
        export PIP_USER=false
        sudo python3 -m pip list --outdated --format=freeze |
          /bin/grep -v '^\-e' |
          /bin/cut -d = -f 1 |
          sudo xargs -r -n1 sudo python3 -m pip install -U -q --progress-bar ascii --no-cache-dir
        unset PIP_USER
      fi
    fi
    if command -- cargo -h >/dev/null 2>&1; then
      if ! command -- cargo-install-update -h >/dev/null 2>&1; then
        cargo install --all-features cargo-update
      fi
      if command -- cargo-install-update -h >/dev/null 2>&1; then
        cargo-install-update install-update --all
      fi
    fi
    # [ NOTE ] => merge xresources and i3 config once per login
    [ -d ~/.dotfiles ] && git -C ~/.dotfiles pull >/dev/null 2>&1
    if command -- xrdb -h >/dev/null 2>&1; then
      if [ -d ~/.Xresources.d ]; then
        rm -f ~/.Xresources
        while read i; do
          echo "#include \"$i\"" >>~/.Xresources
        done < <(find ~/.Xresources.d -name '*.Xresources')
        xrdb -merge ~/.Xresources
      fi
    fi
    if command -- i3 -h >/dev/null 2>&1; then
      if [ -d ~/.i3.d ]; then
        mkdir -p ~/.config/regolith/i3
        rm -f ~/.config/regolith/i3/config
        while read i; do
          cat $i >>~/.config/regolith/i3/config
        done < <(find ~/.i3.d -name '*.i3')
      fi
    fi
  fi
  if command -- fastfetch -h >/dev/null 2>&1; then
    fastfetch 2>/dev/null
  fi
fi
[ -d ~/.env.d ] && while read i; do source "$i"; done < <(find ~/.env.d/ -name '*.sh')
[ -d ~/.env.d.local ] && while read i; do source "$i"; done < <(find ~/.env.d.local/ -name '*.sh')
[ -d ~/.alias.d ] && while read i; do source "$i"; done < <(find ~/.alias.d/ -name '*.sh')
[ -d ~/.alias.d.local ] && while read i; do source "$i"; done < <(find ~/.alias.d.local/ -name '*.sh')
[ -d ~/.profile.d ] && while read i; do source "$i"; done < <(find ~/.profile.d/ -name '*.sh')
[ -d ~/.profile.d.local ] && while read i; do source "$i"; done < <(find ~/.profile.d.local/ -name '*.sh')
[ -r /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
if command -- starship -h >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi
if command -- rustup -h >/dev/null 2>&1; then
  eval "$(rustup completions bash rustup)"
  eval "$(rustup completions bash cargo)"
fi
