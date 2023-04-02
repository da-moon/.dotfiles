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
if command -- rustup -h >/dev/null 2>&1; then
  eval "$(rustup completions bash rustup)"
  eval "$(rustup completions bash cargo)"
fi
if command -- starship -h >/dev/null 2>&1; then
  # [ -r "${HOME}/.config/starship-bash.toml" ] && export STARSHIP_CONFIG="${HOME}/.config/starship-bash.toml" ;
  eval "$(starship init bash)"
fi
# if command -- emplace -h >/dev/null 2>&1; then
#   source <(emplace init bash)
# fi
[ -x "$(command -v repo)" ] && {
    [ -x "$(command -v fzf)" ] && eval "$(repo init bash --fzf)" || eval "$(repo init bash)"
}
if command -- zoxide -h >/dev/null 2>&1; then
  eval "$(zoxide init bash)"
fi
[ -x "$(command -v zellij)" ] && eval "$(zellij setup --generate-auto-start bash)"