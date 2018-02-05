#!/bin/bash

# Update homebrew recipes
printf "Update recipes? [Y/n]: " && read ANS
if [ "${ANS}" = "Y" ]; then
	sudo apt-get update -y
fi

# Upgrade all
printf "Upgrade? [Y/n]: " && read ANS
if [ "${ANS}" = "Y" ]; then
	sudo apt-get upgrade -y
fi

packages=(
	#zsh
	zsh

	#gnu command
	coreutils

	# tmux
	tmux
	reattach-to-user-namespace

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
	direnv
	glide
	jq
	jid
	graphviz
	emojify
	autoenv
	the_silver_searcher
	highlight
	z
	terminal-notifier
	source-highlight
	ccat
	knqyf263/pet/pet
	s-search
	chrome-cli
	translate-shell

	# Languages
	phpbrew
	pyenv
	rbenv
	ruby-build
)
sudo apt-get install -y ${packages[@]} & sudo apt-get autoremove
