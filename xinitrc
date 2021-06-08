#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
[ -d $HOME/.i3.d ] && ( rm -f $HOME/.config/regolith/i3/config && while read i; do cat $i >> $HOME/.config/regolith/i3/config ; done < <(find $HOME/.i3.d -type f -name '*.i3')) 
[ -d $HOME/.Xresources.d ] && ( rm -f $HOME/.Xresources && while read i; do echo "#include \"$i\"" >> $HOME/.Xresources ; done < <(find $HOME/.Xresources.d -type f -name '*.Xresources') && xrdb -merge $HOME/.Xresources) 
# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
export SSH_AUTH_SOCK
export $(dbus-launch)
exec regolith-session
