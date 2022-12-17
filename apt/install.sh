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
	#general
	build-essential
	curl
	ibus-mozc
	vim
	gnome-tweaks
	zlib1g

	#zsh
	zsh

	# git
	git
	tig

	# gcc
	gcc
	clang
	clang-format

	#ruby
	rubygems

	#sqlite
	sqlite3

	# Utils
	albert
	xsel
	xclip
	bat
	ripgrep
	fzf

	#perfomace
	sysstat
	strace
	pyenv
	rbenv
)
for pkg in ${packages[@]}; do
	sudo apt-get install -y $pkg
done
sudo apt-get autoremove -y
