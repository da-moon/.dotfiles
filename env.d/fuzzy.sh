# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

# https://mike.place/2017/fzf-fd

# If we have fd, change some defaults to use it.
if command -- fzf -h > /dev/null 2>&1; then
  if type fd >/dev/null 2>&1; then
    excludes="--exclude .git"
    excludes="${excludes} --exclude .vagrant"
    excludes="${excludes} --exclude .vagrant.d "
    excludes="${excludes} --exclude node_modules"
    if command -- go version > /dev/null 2>&1 ; then
      excludes="${excludes} --exclude $(go env GOPATH | sed -e "s/\/home\/$USER\///g")/pkg"
    fi
    export FZF_ALT_C_COMMAND="fd --type d --hidden --follow -j $(nproc) --color always ${excludes}"
    export FZF_CTRL_T_COMMAND="${FZF_ALT_C_COMMAND} --max-depth 6"
  fi
  # Tweak the default settings
  export FZF_DEFAULT_OPTS="--multi --height=40% --reverse --tabstop=4 -0"
  FZF_DEFAULT_OPTS+=" --prompt=' │ ' --color=prompt:0,hl:178,hl+:178"
  FZF_DEFAULT_OPTS+=" --bind='ctrl-t:toggle-all,ctrl-g:select-all+accept'"
  FZF_DEFAULT_OPTS+=" --bind='tab:down,shift-tab:up'"
  FZF_DEFAULT_OPTS+=" --bind='?:toggle-preview,ctrl-space:toggle'"
  # FZF_ALT_C_OPTS="--preview='_fzf_preview_fs {}' -1 -0"
  # FIXME : replace echo with nvim
  export FZF_CTRL_T_OPTS='--multi --cycle --border --reverse --ansi --tiebreak begin,length,index --filepath-word'
  FZF_CTRL_T_OPTS+=' --header "Press ? to toggle preview." --border --prompt "FZF File Finder"'
  FZF_CTRL_T_OPTS+=' --bind "?:toggle-preview" --preview="_fzf_preview_fs {}"'
  FZF_CTRL_T_OPTS+=' --bind ctrl-e:execute:"echo {}"'
  FZF_CTRL_T_OPTS+=' --bind change:top'
  FZF_CTRL_T_OPTS+=' --bind=ctrl-j:accept'
  FZF_CTRL_T_OPTS+=' --bind=ctrl-k:kill-line'

  export FZF_ALT_C_OPTS='--cycle --ansi --tiebreak begin,length,index --no-multi --filepath-word'
  FZF_ALT_C_OPTS+=' --header "Press ? to toggle preview." --border --prompt "FZF Dir Finder"'
  FZF_ALT_C_OPTS+=' --bind "?:toggle-preview" --preview="_fzf_preview_fs {}" -1 -0'
  # Bash history and completion
  export FZF_CTRL_R_OPTS=" --preview='echo {}' --preview-window=down:3:wrap"
  export FZF_COMPLETION_TRIGGER='@'
fi