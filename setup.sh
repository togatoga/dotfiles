#!/bin/bash

if [ "$(uname)" == "Darwin" ];then
    ./homebrew/install.sh
fi

# go
echo "Set up Golang..."
./go/get.sh

# rust
echo "Set up Rust...."
if test ! $(which rustc);then
    echo "Install Rust..."
    ./rust/install.sh
fi

./rust/get.sh

# tmux
echo "Set up Tmux..."
./.tmux/init.sh

# zplug
echo "Set up zplug..."
if [ ! -d ~/.zplug ];then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

./bootstrap.sh
