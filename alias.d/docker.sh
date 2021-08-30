# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
alias debian-c='docker run --rm -it -v "$PWD:/workspace" -w "/workspace" debian:bullseye'
alias alpine-c='docker run --rm -it -v "$PWD:/workspace" -w "/workspace" alpine:edge'

