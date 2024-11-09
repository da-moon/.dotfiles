#!/usr/bin/env bash
get_session_type() {
  if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    echo "wayland"
  elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
    echo "x11"
  else
    if [ -n "$WAYLAND_DISPLAY" ]; then
      echo "wayland"
    elif [ -n "$DISPLAY" ]; then
      echo "x11"
    else
      echo "unknown"
    fi
  fi
}

# Set aliases based on the session type
session_type=$(get_session_type)
if [ "$session_type" = "wayland" ]; then
  alias cpy='wl-copy'
  alias pst='wl-paste'
elif [ "$session_type" = "x11" ]; then
  alias cpy='xclip -sel clip'
  alias pst='xclip -sel clip -o'
else
  alias cpy='xclip -sel clip'
  alias pst='xclip -sel clip -o'
fi
