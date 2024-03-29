#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
#
# ──── SSH ────────────────────────────────────────────────────────────
#
[ ! -d "${HOME}/.ssh" ] && mkdir "${HOME}/.ssh"
chmod 700 "${HOME}/.ssh"
[ ! -r "${HOME}/.ssh/known_hosts" ] && touch "${HOME}/.ssh/known_hosts"
chmod 644 "${HOME}/.ssh/known_hosts"
# ─────────────────────────────────────────────────────────────────────
[ -r "${HOME}/.ssh/authorized_keys" ] && chmod 644 "${HOME}/.ssh/authorized_keys"
[ -r "${HOME}/.ssh/config" ] && chmod 644 "${HOME}/.ssh/config"
[ -r "${HOME}/.ssh/id_rsa" ] && chmod 600 "${HOME}/.ssh/id_rsa"
[ -r "${HOME}/.ssh/id_rsa.pub" ] && chmod 644 "${HOME}/.ssh/id_rsa.pub"
