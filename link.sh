#!/bin/bash

set -e

#link to dotfiles
ln -sf ~/dotfiles/.zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitconfig_local ~/.gitconfig_local
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
