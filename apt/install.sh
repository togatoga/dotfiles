#!/bin/bash

# repository
sudo add-apt-repository -y ppa:gophers/archive
sudo add-apt-repository -y ppa:nilarimogard/webupd8

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

	#perfomace
	sysstat
	strace

)
for pkg in ${packages[@]}; do
	sudo apt-get install -y $pkg
done
sudo apt-get autoremove -y
