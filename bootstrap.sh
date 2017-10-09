#!/bin/bash

set -e

#link to dotfiles
ln -sf ~/dotfiles/.zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.emacs.d ~/.emacs.d
ln -sf ~/dotfiles/.emacs.d/.emacs.el ~/.emacs.el
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.peco/config.json ~/.config/peco/config.json
