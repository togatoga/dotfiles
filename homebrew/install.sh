#!/bin/bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/binary
brew tap thoughtbot/formulae
brew tap caskroom/fonts

packages=(
  #zsh
  zsh

  # tmux
  tmux
  reattach-to-user-namespace

  # git
  git
  hub
  tig
  gist

  # gcc
  gcc
  clang-format

  # go
  go

  # Emcas
  cask

  # Utils
  peco
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
  ag
  direnv
  glide
  jq
  graphviz

  # Languages
  pyenv
  rbenv
  ruby-build
)

echo "installing binaries..."
brew install ${packages[@]} && brew cleanup