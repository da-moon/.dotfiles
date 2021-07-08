#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
export EDITOR="nvim"
[ -d ~/.env.d ] && while read i; do source "$i" ; done < <(find ~/.env.d/ -name '*.sh')
[ -d ~/.alias.d ] && while read i; do source "$i" ; done < <(find ~/.alias.d/ -name '*.sh')
[ -d ~/.profile.d ] && while read i; do source "$i" ; done < <(find ~/.profile.d/ -name '*.sh')
if command -- starship -h > /dev/null 2>&1 ; then
  eval "$(starship init bash)"
fi
if [ -z ${TERM_PROGRAM+x} ] || [ -z ${TERM_PROGRAM} ] || [ -z ${TERM_PROGRAM} ]; then
  if command -- fastfetch -h > /dev/null 2>&1 ; then
    fastfetch 2>/dev/null
  fi
  if command -- colorscript -h > /dev/null 2>&1 ; then
    color_scripts=("3" "14" "15" "16" "17" "9" "21" 
    "22" "23" "24" "27" "28" "29" "30" "31" "34" "36"
    "39" "41" "42" "44" "45" "46" "47" "48");
    colorscript -e ${color_scripts[RANDOM%${#color_scripts[@]}]}
  fi
  if [ ! -r /tmp/login.lock ] ;then
    touch /tmp/login.lock;
    if command -- pmm -h > /dev/null 2>&1 ; then
    sudo pacman -Syyu --noconfirm ;
    else
      if command -- pacman -h > /dev/null 2>&1 ; then
        sudo pacman -Syyu --noconfirm ;
        if command -- pacman -h > /dev/null 2>&1 ; then
          paru -Syyu --cleanafter --noconfirm
        fi
      fi
      if command -- apt-get -h > /dev/null 2>&1 ; then
        sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y --purge
      fi
    fi
  fi
  [ -d ~/.Xresources.d ] && ( rm -f ~/.Xresources && while read i; do echo "#include \"$i\"" >> ~/.Xresources ; done < <(find ~/.Xresources.d -name '*.Xresources') && xrdb -merge ~/.Xresources) 
  [ -d ~/.i3.d ] && ( mkdir -p ~/.config/regolith/i3 && rm -f ~/.config/regolith/i3/config && while read i; do cat $i >> ~/.config/regolith/i3/config ; done < <(find ~/.i3.d -name '*.i3')) 
fi