#!/bin/bash

# homebrew
if [ "$(uname)" == "Darwin" ]; then
	./homebrew/install.sh
fi

if [ "$(uname)" == "Linux" ]; then
	./apt/install.sh
fi


# Create ~/.config
if [ ! -d ~/.config ]; then
	mkdir ~/.config
fi
# emacs
pushd .emacs.d
cask install
popd

# python
echo "Set up Python..."
./python/get.sh

# go
echo "Set up Golang..."
./go/get.sh
# peco
if [ "$(uname)" == "Linux" ];then
	echo "Set up peco..."
	./.peco/install.sh
fi

# rust
echo "Set up Rust...."
if test ! $(which rustc); then
	echo "Install Rust..."
	./rust/install.sh
fi
./rust/get.sh

# tmux
echo "Set up Tmux..."
./.tmux/init.sh

# zplug
echo "Set up zplug..."
if [ ! -d ~/.zplug ]; then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

./link.sh
