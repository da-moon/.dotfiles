if command -- rg -h > /dev/null 2>&1 ; then
  alias grep="rg"
fi
if command -- exa -h > /dev/null 2>&1 ; then
  alias ls="exa"
  alias la="exa -A"
  alias ll="exa -alhF"
fi
if command -- bat -h > /dev/null 2>&1 ; then
  alias cat="bat -pp"
fi
