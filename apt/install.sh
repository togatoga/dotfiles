#!/bin/bash

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

if confirm "Update apt recipes?" N; then
    sudo apt-get update
fi

if confirm "Upgrade installed packages?" N; then
    sudo apt-get upgrade
fi

packages=(
    build-essential
    curl
    ibus-mozc
    vim
    gnome-tweaks
    zlib1g
    zsh
    git
    tig
    gcc
    clang
    clang-format
    rubygems
    sqlite3
    albert
    xsel
    xclip
    bat
    ripgrep
    fzf
    sysstat
    strace
    pyenv
    rbenv
    htop
    chrome-gnome-shell
)

# Install per-package so one unavailable package does not abort the rest.
for pkg in "${packages[@]}"; do
    sudo apt-get install -y "$pkg" || warn "Failed to install $pkg, skipping"
done
sudo apt-get autoremove -y
