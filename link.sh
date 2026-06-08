#!/bin/bash

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

# Symlink $1 -> $2, refusing to clobber a real (non-symlink) file.
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        warn "$dest exists and is not a symlink. Skipping."
        return 0
    fi

    ln -sf "$src" "$dest"
    ok "$dest -> $src"
}

info "Creating symlinks..."

# Home-directory dotfiles
link_file "$DOTFILES_ROOT/.zsh/.zshrc"        ~/.zshrc
link_file "$DOTFILES_ROOT/.tmux.conf"         ~/.tmux.conf
link_file "$DOTFILES_ROOT/.vim/.vimrc"        ~/.vimrc
link_file "$DOTFILES_ROOT/.tigrc"             ~/.tigrc
link_file "$DOTFILES_ROOT/.gitconfig"         ~/.gitconfig
link_file "$DOTFILES_ROOT/.gitconfig.local"   ~/.gitconfig.local
link_file "$DOTFILES_ROOT/.gitignore_global"  ~/.gitignore_global

# ~/.config links
mkdir -p ~/.config

# Alacritty (macOS + Linux)
link_file "$DOTFILES_ROOT/.alacritty" ~/.config/alacritty

# atuin (config only; history DB lives in ~/.local/share/atuin)
mkdir -p ~/.config/atuin
link_file "$DOTFILES_ROOT/atuin/config.toml" ~/.config/atuin/config.toml

# Linux-specific
if is_linux; then
    link_file "$DOTFILES_ROOT/xremap" ~/.config/xremap
    link_file "$DOTFILES_ROOT/fcitx5" ~/.config/fcitx5
fi

ok "All symlinks created successfully"
