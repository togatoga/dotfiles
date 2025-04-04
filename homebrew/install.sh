#!/bin/bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
	echo "Installing homebrew..."
	if [ "$(uname)" == 'Darwin' ]; then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
fi

# Update homebrew recipes
printf "Update recipes? [Y/n]: " && read ANS
if [ "${ANS}" = "Y" ]; then
	brew update
fi

# Upgrade all
printf "Upgrade? [Y/n]: " && read ANS
if [ "${ANS}" = "Y" ]; then
	brew upgrade
fi

packages=(
	# git
	hub
	tig
	gist
	git-lfs
	gh

	# Utils
	tmux
	bat
	peco
	fzf
	wget
	tree
	openssl
	libyaml
	nkf
	direnv
	jq
	#graphviz
	autoenv
	highlight
	tldr
	htop
	s-search

	# Languages
	ruby-build
)

mac_packages=(
	#gnu command
	coreutils
	gcc
	# tmux
	reattach-to-user-namespace
	# gcc
	clang-format
	# utils
	automake
	terminal-notifier
	chrome-cli
	proctools
	urlview
	# cross compile
	FiloSottile/musl-cross/musl-cross
	ripgrep
)

if [ "$(uname)" == 'Darwin' ]; then
	echo "installing binaries..."
	brew install ${packages[@]} && brew cleanup
	brew install ${mac_packages[@]} && brew cleanup
	brew install --cask alacritty
fi
