alias aur='read -s -p "pkg: " pkg; rm -rf "/tmp/$pkg" ; git clone  "https://aur.archlinux.org/$pkg.git" "/tmp/$pkg" ; pushd "/tmp/$pkg"; makepkg -sic --noconfirm ; popd ; sudo rm -rf "/tmp/$pkg"; unset $pkg'
alias pacman='command -v brl > /dev/null 2>&1 && arch sudo pacman || sudo pacman'
