#!/bin/bash

# repository
sudo add-apt-repository ppa:gophers/archive

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
	#zsh
	zsh

	# tmux
	tmux

	# git
	git
	hub
	tig
	gist

	# gcc
	gcc
	clang-format

	# go
	golang-1.9-go

	#ruby
	rubygems

	#sqlite
	sqlite3

	# Utils
	autoconf
	proctools
	automake
	rmtrash
	wget
	curl
	tree
	openssl
	libyaml
	readline
	markdown
	nkf
	glide
	jq
	jid
	graphviz
	autoenv
	silversearcher-ag
	highlight
	source-highlight
	translate-shell
	xsel
	jq

	# Languages
	pyenv
	rbenv
	ruby-build
)
for pkg in ${packages[@]}; do
	sudo apt-get install -y $pkg
done
sudo apt-get autoremove -y
