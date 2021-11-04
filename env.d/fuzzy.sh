# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

# https://mike.place/2017/fzf-fd
if fd -h > /dev/null 2>&1 ; then
  export FZF_DEFAULT_COMMAND="fd . $HOME"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd -t d . $HOME"
fi
