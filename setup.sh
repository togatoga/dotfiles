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

./bootstrap.sh



