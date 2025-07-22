#!/usr/bin/env bash

set -efuo pipefail

. /etc/os-release

# Check ID and ID_LIKE for Arch or Debian
if [[ "$ID" == "arch" ]] || [[ "$ID_LIKE" == *"arch"* ]]; then
    echo "This is an Arch-based system"
    # Insert Arch specific commands here
    sudo pacman -S --noconfirm --needed marksman
    sudo pacman -S --noconfirm --needed vscode-json-languageserver
    sudo pacman -S --noconfirm --needed vscode-html-languageserver
    sudo pacman -S --noconfirm --needed vscode-css-languageserver
    sudo pacman -S --noconfirm --needed typescript-language-server
    sudo pacman -S --noconfirm --needed bash-language-server
    sudo pacman -S --noconfirm --needed python-lsp-server
    sudo pacman -S --noconfirm --needed gopls
    sudo pacman -S --noconfirm --needed deno
    sudo pacman -S --noconfirm --needed python-black
    sudo pacman -S --noconfirm --needed yaml-language-server
    sudo pacman -S --noconfirm --needed ansible-language-server
    sudo pacman -S --noconfirm --needed taplo-cli
    sudo pacman -S --noconfirm --needed prettier
    sudo pacman -S --noconfirm --needed shfmt
  if command -v paru >/dev/null 2>&1; then
      paru -S --removemake --cleanafter --needed --noconfirm aur/yaml-language-server-git
      paru -S --removemake --cleanafter --needed --noconfirm aur/awk-language-server
      paru -S --removemake --cleanafter --needed --noconfirm aur/cmake-language-server
      paru -S --removemake --cleanafter --needed --noconfirm aur/protobuf-language-server
      paru -S --removemake --cleanafter --needed --noconfirm aur/golangci-lint-langserver-bin
      paru -S --removemake --cleanafter --needed --noconfirm aur/terraform-ls-bin
  fi

elif [[ "$ID" == "debian" ]] || [[ "$ID_LIKE" == *"debian"* ]]; then
    echo "This is a Debian-based system"
    export DEBIAN_FRONTEND="noninteractive"
    # INSERT DEBIAN SPECIFIC COMMANDS HERE
    sudo apt-get update -qq \
    && sudo apt-get install -yq \
      python3-pylsp \
      bash-language-server \
      prettier

  if command -v go >/dev/null 2>&1; then
    go install golang.org/x/tools/gopls@latest
    go install github.com/nametake/golangci-lint-langserver@latest
    go install mvdan.cc/sh/v3/cmd/shfmt@latest
  fi
  export PATH="$HOME/.deno/bin:$PATH"

  if ! command -v deno >/dev/null 2>&1; then
    curl -fsSL https://deno.land/install.sh | sh
  fi
  if ! command -v python3 >/dev/null 2>&1; then
    sudo python3 -m pip install black

  fi
  if command -v npm >/dev/null 2>&1; then
    sudo npm install -g \
      @ansible/ansible-language-server \
      graphql-language-service-cli \
      awk-language-server \
      @hashicorp/terraform-ls \
      cmake-language-server \
      @taplo/cli \
      @bufbuild/buf-language-server \
      golangci-lint-langserver \
      yaml-language-server
  fi

else
    echo "Unsupported or other Linux distribution: $ID"
    echo "Available info: $PRETTY_NAME"
    exit 1
fi

if command -v rustup >/dev/null 2>&1; then

  rustup component add rust-analyzer
fi
