#!/bin/bash

set -e

# Helper function
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "⚠ $dest exists and is not a symlink. Skipping."
        return 1
    fi

    ln -sf "$src" "$dest"
    echo "✓ $dest -> $src"
}

echo "Creating symlinks..."

# Link dotfiles
link_file ~/dotfiles/.zsh/.zshrc ~/.zshrc
link_file ~/dotfiles/.tmux.conf ~/.tmux.conf
link_file ~/dotfiles/.vim/.vimrc ~/.vimrc
link_file ~/dotfiles/.tigrc ~/.tigrc
link_file ~/dotfiles/.gitconfig ~/.gitconfig
link_file ~/dotfiles/.gitconfig.local ~/.gitconfig.local
link_file ~/dotfiles/.gitignore_global ~/.gitignore_global

# .config directory links
mkdir -p ~/.config

# Alacritty (macOS + Linux)
link_file ~/dotfiles/.alacritty ~/.config/alacritty

# Linux-specific
if [ "$(uname)" = 'Linux' ]; then
    link_file ~/dotfiles/xremap ~/.config/xremap
    link_file ~/dotfiles/fcitx5 ~/.config/fcitx5
fi

echo "✓ All symlinks created successfully"
