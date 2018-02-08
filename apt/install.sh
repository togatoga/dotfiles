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
	#zsh
	zsh

	# tmux
	tmux

	# git
	git

	# gcc
	gcc
	clang-format

	#ruby
	rubygems

	#sqlite
	sqlite3


	# Utils
	albert
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
