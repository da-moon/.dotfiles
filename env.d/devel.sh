# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
export LUNARVIM_CONFIG_DIR="${HOME}/.LunarVim.d/"
if [ -d ~/.goenv ]; then
  git -C ~/.goenv pull > /dev/null 2>&1
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$PATH:$GOENV_ROOT/bin"
  eval "$(goenv init -)"
fi
if command -- go version > /dev/null 2>&1 ; then
  export PATH="$PATH:$(go env GOROOT)/bin"
  export PATH="$PATH:$(go env GOPATH)/bin"
  [ "$(go env GO111MODULE)" != "on" ] && go env -w "GO111MODULE=on" 
  [ "$(go env CGO_ENABLED)" != "0" ] && go env -w "CGO_ENABLED=0"
  [ "$(go env CGO_LDFLAGS)" != "-s -w -extldflags '-static'" ] && go env -w "CGO_LDFLAGS=-s -w -extldflags '-static'"
fi
if [ -d "${HOME}/.cargo" ];then
  export CARGO_HOME="${HOME}/.cargo"
  export PATH="${CARGO_HOME}/bin:${PATH}"
fi
[ -r "$HOME/.poetry/env" ] && source "$HOME/.poetry/env"
if luarocks --version > /dev/null 2>&1 ; then
  if lua5.1 -v > /dev/null 2>&1 ; then
    eval "$(luarocks --lua-version=5.1 path)"
  elif lua5.2 -v > /dev/null 2>&1 ; then
    eval "$(luarocks --lua-version=5.2 path)"
  elif lua5.3 -v > /dev/null 2>&1 ; then
    eval "$(luarocks --lua-version=5.3 path)"
  elif lua5.4 -v > /dev/null 2>&1 ; then
    eval "$(luarocks --lua-version=5.4 path)"
  fi
fi
if [ -d "${HOME}/.local/share/lunarvim/lvim" ];then
  export LUA_PATH="$LUA_PATH;${HOME}/.local/share/lunarvim/lvim"
fi