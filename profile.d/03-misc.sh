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

if command -- i3 -h >/dev/null 2>&1 && [ -d "${HOME}/.i3.d" ]; then
  function i3-refresh() {
    mkdir -p "${HOME}/.config/regolith/i3"
    rm -f "${HOME}/.config/regolith/i3/config"
    while read -r i; do
      cat "${i}" >> "${HOME}/.config/regolith/i3/config"
    done < <(find "${HOME}/.config/regolith/i3.d" -name '*.i3')
    sed -i -e '/^\s*$/d' -e '/^\s*#/d' "${HOME}/.config/regolith/i3/config"
  }
fi
if [ -d "${HOME}/.dotfiles" ];then
  git -C "${HOME}/.dotfiles" submodule update --init --recursive >/dev/null 2>&1 &&
  git -C "${HOME}/.dotfiles" pull --recurse-submodules >/dev/null 2>&1
  if command -- xrdb -version >/dev/null 2>&1 && [ -d "${HOME}/.Xresources.d" ]; then
    function x-refresh(){
      rm -f "${HOME}/.Xresources"
      while read -r i; do
        echo "#include \"$i\"" >>"${HOME}/.Xresources"
      done < <(find "${HOME}/.Xresources.d" -name '*.Xresources')
      xrdb -merge "${HOME}/.Xresources"
    }
  fi
fi

