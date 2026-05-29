#!/bin/bash

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

if ! is_mac; then
    exit 0
fi

# Install Homebrew if missing.
if ! command -v brew &> /dev/null; then
    info "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if confirm "Update homebrew recipes?" N; then
    brew update
fi

if confirm "Upgrade installed packages?" N; then
    brew upgrade
fi

packages=(
    # git
    hub
    tig
    gist
    git-lfs
    gh

    # Utils
    tmux
    bat
    fzf
    wget
    tree
    openssl
    libyaml
    nkf
    direnv
    jq
    #graphviz
    autoenv
    highlight
    tldr
    htop
    s-search

    # Languages
    ruby-build
)

mac_packages=(
    # gnu command
    coreutils
    gcc
    # tmux
    reattach-to-user-namespace
    # gcc
    clang-format
    # utils
    automake
    terminal-notifier
    chrome-cli
    proctools
    urlview
    # cross compile
    FiloSottile/musl-cross/musl-cross
    ripgrep
)

info "installing binaries..."
brew install "${packages[@]}" && brew cleanup
brew install "${mac_packages[@]}" && brew cleanup
brew install --cask alacritty
