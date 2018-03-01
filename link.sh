#!/bin/bash

set -e

#link to dotfiles
ln -sf ~/dotfiles/.zsh/.zshrc ~/.zshrc
#tmux
echo $IS_LINUX
if [ "$(uname)" = 'Linux' ]; then
	ln -sf ~/dotfiles/.tmux/.ubuntu_tmux.conf ~/.tmux.conf
elif [ "$(uname)" = 'Darwin' ]; then
	ln -sf ~/dotfiles/.tmux/.mac_tmux.conf ~/.tmux.conf
else
	exit 0
fi

ln -sf ~/dotfiles/.vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.emacs.d ~/.emacs.d
ln -sf ~/dotfiles/.emacs.d/.init.el ~/.init.el
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global

mkdir -p ~/.config/peco/
ln -sf ~/dotfiles/.peco/config.json ~/.config/peco/config.json
