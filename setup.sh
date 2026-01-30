#!/bin/bash

set -e  # Exit on error
set -u  # Exit on undefined variable

#.gitconfig.local
printf "Install .gitconfig.local? (Y/n): " && read ANS
case "${ANS}" in
    [Yy]* | "")
        if [ -f ~/.gitconfig.local ]; then
            echo "✓ .gitconfig.local already exists, skipping"
        else
            cp .gitconfig.local ~/
            echo "✓ .gitconfig.local installed"
        fi
        ;;
    *)
        echo "Skipping .gitconfig.local"
        ;;
esac

# apt-get,snap
if [ "$(uname)" = "Linux" ]; then
	echo "Installing Linux packages..."
	./apt/install.sh
fi

# homebrew
./homebrew/install.sh

# Create ~/.config
if [ ! -d ~/.config ]; then
	mkdir ~/.config
	echo "✓ Created ~/.config"
else
	echo "✓ ~/.config already exists"
fi

echo "Set up Docker..."
./docker/init.sh

# rust
if ! command -v rustc &> /dev/null; then
    echo "Installing Rust..."
    ./rust/install.sh
    echo "✓ Rust installed"
else
    echo "✓ Rust already installed ($(rustc --version))"
fi

# tmux
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Installing Tmux Plugin Manager..."
    ./.tmux/init.sh
    echo "✓ Tmux Plugin Manager installed"
else
    echo "✓ Tmux Plugin Manager already installed"
fi

# zinit will be auto-installed on first zsh startup
echo "Note: zinit will be auto-installed on first zsh startup"

./link.sh
