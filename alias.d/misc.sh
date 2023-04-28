#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if [ -x "$(command -v zoxide)" ];then
  alias cd="z" ;
else
  alias cd="pushd" ;
fi
alias ..='cd ..'

alias nocmt="sed -e '/#/d' -e '/^[[:space:]]*$/d'"
alias pprintenv="printenv | awk 'BEGIN{FS=OFS=\"=\";}{printf \"%-30s%-18s\n\",\$1,\$2}'"
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date -u +"%Y-%m-%d"'
# if command -- aria2c -h > /dev/null 2>&1 ; then
  alias dl="aria2c --optimize-concurrent-downloads -k 1M -j16 -x 16 -c --file-allocation=falloc"
# fi
if ! command -- code -h > /dev/null 2>&1 ; then
  if command -- code-insiders -h > /dev/null 2>&1 ; then
    alias code="code-insiders"
  fi
fi
# if command -- netstat -h > /dev/null 2>&1 ; then
  alias ports='netstat -tulanp'
# fi
# if command -- sk -h > /dev/null 2>&1 ; then
  alias skm='sk -m'
  alias skf="${SKIM_DEFAULT_COMMAND} | sk"
  alias skvi='nvim $(skfi)'
# fi
# if command -- pandoc -h > /dev/null 2>&1; then
  alias md2jira='pandoc --from gfm --to jira'
  alias md2pdf='pandoc --from markdown --pdf-engine=xelatex'
  alias md2word='pandoc --from markdown --to docx'
  alias md2ppt='pandoc --from markdown --to pptx'
# fi
# if command -- kitty -h > /dev/null 2>&1; then
  alias icat="kitty +kitten icat"
# fi

alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
#
# ──── FASD ──────────────────────────────────────────────────────────
#

# if command -- fasd -h > /dev/null 2>&1 ; then
  # any
  # alias a='fasd -a'
  # # show / search / select
  # alias s='fasd -si'
  # # directory
  # alias d='fasd -d'
  # # file
  # alias f='fasd -f'
  # # interactive directory selection
  # alias sd='fasd -sid'
  # # interactive file selection
  # alias sf='fasd -sif'
  # # cd, same functionality as j in autojump
  # alias z='fasd_cd -d'
  # # cd with interactive selection
  # alias zz='fasd_cd -d -i'
# fi
# if fzf -h > /dev/null 2>&1 && bat -h > /dev/null 2>&1  ; then
  alias fzfbat="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# fi
alias tmpdir='pushd "$(mktemp -d)"'
alias remark-fmt="remark --use remark-toc='\"heading\": \"Table of contents\",\"tight\" : true' --use remark-frontmatter --use remark-reference-links --use remark-stringify='bullet: \"-\",listItemIndent: \"one\"'"
alias prettier-md='prettier --print-width=79 --prose-wrap=always --parser markdown'
# https://superuser.com/questions/763071/show-whitespace-characters-in-printout
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"
alias xcd='cd "$(xplr --print-pwd-as-result)"'

alias xcopy='xclip -sel c';
alias xpaste='xclip -sel c -o'
