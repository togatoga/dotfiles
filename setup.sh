#!/bin/bash

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

# .gitconfig.local
if confirm "Install .gitconfig.local?"; then
    if [ -f ~/.gitconfig.local ]; then
        ok ".gitconfig.local already exists, skipping"
    else
        cp "$DOTFILES_ROOT/.gitconfig.local" ~/
        ok ".gitconfig.local installed"
    fi
else
    info "Skipping .gitconfig.local"
fi

# OS-specific packages
if is_linux; then
    info "Installing Linux packages..."
    "$DOTFILES_ROOT/apt/install.sh"
elif is_mac; then
    info "Installing Homebrew packages..."
    "$DOTFILES_ROOT/homebrew/install.sh"
fi

# Create ~/.config
if [ ! -d ~/.config ]; then
    mkdir ~/.config
    ok "Created ~/.config"
else
    ok "~/.config already exists"
fi

# Docker (Linux only; the script no-ops elsewhere)
info "Setting up Docker..."
"$DOTFILES_ROOT/docker/init.sh"

# Rust
if ! command -v rustc &> /dev/null; then
    info "Installing Rust..."
    "$DOTFILES_ROOT/rust/install.sh"
    ok "Rust installed"
else
    ok "Rust already installed ($(rustc --version))"
fi

# tmux
if [ ! -d ~/.tmux/plugins/tpm ]; then
    info "Installing Tmux Plugin Manager..."
    "$DOTFILES_ROOT/.tmux/init.sh"
    ok "Tmux Plugin Manager installed"
else
    ok "Tmux Plugin Manager already installed"
fi

# atuin (shell history)
info "Setting up atuin..."
"$DOTFILES_ROOT/atuin/install.sh"

# zinit is auto-installed on first zsh startup (see .zsh/zinit/zinit.zsh)
info "zinit will be auto-installed on first zsh startup"

"$DOTFILES_ROOT/link.sh"
