#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

have() { type "$1" >/dev/null  2>&1; }
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
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
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# [ -r "${HOME}/.Xauthority" ] && rm "${HOME}/.Xauthority"
if [ ! "$SSH_AUTH_SOCK" ] && have ssh-agent; then
  exec ssh-agent "$0" "$@" || exit
fi

[ -r "/usr/libexec/pipewire-launcher" ] && /usr/libexec/pipewire-launcher
[ -r "/usr/local/libexec/pipewire-module-xrdp/load_pw_modules.sh" ] && /usr/local/libexec/pipewire-module-xrdp/load_pw_modules.sh

DESKTOP_SESSION="${DESKTOP_SESSION:-kde}"
case "${DESKTOP_SESSION}" in
xfce)
  exec startxfce4
  ;;
kde)
  # sudo pacman -Syy plasma-meta
  exec startplasma-x11
  ;;
regolith)
  export XDG_SESSION_DESKTOP="regolith"
  export XDG_CURRENT_DESKTOP="Regolith:GNOME-Flashback:GNOME"
  export DESKTOP_SESSION="regolith"
  export XAUTHORITY="${HOME}/.Xauthority"
  exec dbus-run-session gnome-session --session=regolith --disable-acceleration-check
  ;;
gnome)
  export DESKTOP_SESSION="GNOME"
  export GNOME_SHELL_SESSION_MODE="x11"
  export XDG_SESSION_TYPE="x11"
  export GDK_BACKEND="x11"
  # exec dbus-run-session gnome-session
  exec dbus-run-session gnome-session >~/.gnome.log  2>&1

  ;;
gnome-classic)
  export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
  export GNOME_SHELL_SESSION_MODE=classic
  exec dbus-run-session gnome-session >~/.gnome-classic.log 2>&1
  ;;
gnome-wayland)
  export MOZ_ENABLE_WAYLAND=1
  export QT_QPA_PLATFORM=wayland
  export XDG_SESSION_TYPE=wayland
  exec dbus-run-session gnome-session >~/.gnome-wayland.log 2>&1
  ;;
i3)
  exec i3
  ;;
*)
  # No known session, try to run it as command
  exec ${DEFAULT_SESSION}
  ;;
esac
