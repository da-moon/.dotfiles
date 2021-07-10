if [ -d ~/.goenv ]; then
  git -C ~/.goenv pull > /dev/null 2>&1
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$PATH:$GOENV_ROOT/bin"
  eval "$(goenv init -)"
fi
if command -- go -h > /dev/null 2>&1 ; then
  export PATH="$PATH:$(go env GOROOT)/bin"
  export PATH="$PATH:$(go env GOPATH)/bin"
  [ "$(go env GO111MODULE)" != "on" ] && go env -w "GO111MODULE=on" 
  [ "$(go env CGO_ENABLED)" != "0" ] && go env -w "CGO_ENABLED=0"
  [ "$(go env CGO_LDFLAGS)" != "-s -w -extldflags '-static'" ] && go env -w "CGO_LDFLAGS=-s -w -extldflags '-static'"
fi