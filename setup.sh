#!/bin/bash

#.gitconfig.local
printf "Do you install .gitconfig.local in this pc?" && read ANS
if [ "${ANS}" == "Y" ]; then
	cp .gitconfig.local ~/
fi

# homebrew
if [ "$(uname)" == "Darwin" ]; then
	./homebrew/install.sh
fi

#apt-get,snap
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

#
if [ "$(uname)" == "Linux" ]; then
	echo "Set up peco..."
	./.peco/install.sh
fi

echo "Set up Docker..."
./docker/init.sh

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
