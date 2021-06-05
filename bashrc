#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
[ -d ~/.dotfiles/env.d ] && while read i; do source "$i" ; done < <(find ~/.dotfiles/env.d/ -type f -name '*.sh')
[ -d ~/.dotfiles/alias.d ] && while read i; do source "$i" ; done < <(find ~/.dotfiles/alias.d/ -type f -name '*.sh')
[ -d ~/.dotfiles/Xresources.d ] && ( rm -f ~/.Xresources && while read i; do echo "#include \"$i\"" >> ~/.Xresources ; done < <(find ~/.dotfiles/Xresources.d -type f -name '*.Xresources') && xrdb -merge ~/.Xresources) 
[ -d ~/.dotfiles/i3.d ] && ( rm -f ~/.config/regolith/i3/config && while read i; do cat $i >> ~/.config/regolith/i3/config ; done < <(find ~/.dotfiles/i3.d -type f -name '*.i3')) 