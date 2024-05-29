#!/usr/bin/env bash
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
if ! command -- reveal-md -h >/dev/null  2>&1; then
  alias reveal-md="docker run --rm -it  -u $(id -u):$(id -g) -p "1948:1948" -p "35729:35729" -v "$(pwd):/slides" webpronl/reveal-md:latest /slides --watch"
fi
alias mlflow="docker run --rm -it -p 5000:5000 ghcr.io/mlflow/mlflow:latest mlflow ui --backend-store-uri sqlite:///mlflow.db"