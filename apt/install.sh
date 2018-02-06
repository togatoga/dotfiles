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
	go

	# Emcas
	cask

	# Utils
	peco
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
	ag
	glide
	jq
	jid
	graphviz
	emojify
	autoenv
	the_silver_searcher
	highlight
	z
	source-highlight
	ccat
	s-search
	translate-shell

	# Languages
	phpbrew
	pyenv
	rbenv
	ruby-build
)
for pkg  in ${packages[@]};
do
	sudo apt-get install -y $pkg
done
sudo apt-get autoremove -y 
