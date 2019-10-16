#!/bin/bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
	echo "Installing homebrew..."
	if [ "$(uname)" == 'Darwin' ]; then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	if [ "$(uname)" == 'Linux' ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
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

# Add Repository
brew tap thoughtbot/formulae
brew tap caskroom/fonts
brew tap caskroom/cask

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
	cmake

	# go
	go

	# Utils
	peco
	fzf
	autoconf
	wget
	curl
	tree
	openssl
	libyaml
	readline
	markdown
	nkf
	direnv
	glide
	jq
	jid
	graphviz
	autoenv
	the_silver_searcher
	pt
	highlight
	source-highlight
	ccat
	knqyf263/pet/pet
	s-search
	translate-shell
	aspell
	git-secrets
	tldr
	aria2
	htop
	doxygen

	# Languages
	pyenv
	rbenv
	ruby-build
)

mac_packages=(
	#gnu command
	coreutils
	gcc
	# tmux
	reattach-to-user-namespace
	# Emcas
	cask
	# gcc
	clang-format
	#utils
	rmtrash
	automake
	terminal-notifier
	chrome-cli
	proctools
	urlview
	ggrep
	# cross compile
    FiloSottile/musl-cross/musl-cross
    ripgrep	
)

echo "installing emacs..."
brew cask install emacs

echo "installing binaries..."
brew install ${packages[@]} && brew cleanup

if [ "$(uname)" == 'Darwin' ]; then
	echo "installing binaries only for macOS"
	brew install ${mac_packages[@]} && brew cleanup
fi
