# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
alias docker-run='docker run --rm -it -v "$PWD:/workspace"'
alias docker-run-u='docker-run --user "$(id -u):$(id -g)"'
alias ubuntu-c='docker-run -w "/workspace" ubuntu:hirsute'
alias debian-c='docker-run -w "/workspace" debian:bullseye'
alias alpine-c='docker-run -w "/workspace" alpine:edge'
alias pureos-c='docker-run -w "/workspace" pureos/pureos:byzantium-slim'
alias gitlint='docker run -u $(id -u):$(id -g) -w /repo --rm -it --ulimit nofile=1024 -v $(pwd):/repo jorisroovers/gitlint'
alias gitleaks='docker run -u $(id -u):$(id -g) -v $(pwd):/path -w /path --rm -it zricethezav/gitleaks:latest'
alias code-server='docker-run --network host -d -u "$(id -u):$(id -g)" codercom/code-server:latest --auth none'
alias rmcontainers='docker ps -aq | xargs -r docker rm -f'
alias gitlint="docker run -u $(id -u):$(id -g) -w /repo --rm -it --ulimit nofile=1024 -v $(pwd):/repo jorisroovers/gitlint"