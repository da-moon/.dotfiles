#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# if [ -r /sbin/iptables ]; then
  alias ipt='sudo /sbin/iptables'
  # display all rules
  alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
  alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
  alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
  alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
# fi
# get web server headers
alias header='curl -I' 
# find out if remote server supports gzip / mod_deflate or not
alias headerc='curl -I --compress'
alias wget='wget -c'
# get system's ip addr
alias my-ip='/sbin/ip -o -4 addr list eth0 | awk "{print $4}" | cut -d/ -f1'

