#!/bin/bash

# Update homebrew recipes
printf "Update recipes? [Y/n]: " && read ANS
if [ "$ANS" = 'Y' ]; then
	sudo apt-get update
fi

# Upgrade all
printf "Upgrade? [Y/n]: " && read ANS
if [ "$ANS" = 'Y' ]; then
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
)
for pkg in ${packages[@]}; do
	sudo apt-get install -y $pkg
done
sudo apt-get autoremove -y
