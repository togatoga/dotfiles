
# Dotfiles

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/tcnksm/dotfiles/blob/master/LICENCE)

====

# ATTENTION PLEASE

This repository is MY PERSONAL dotfiles.

Thank you for your attention.

## Setup

```bash
git clone https://github.com/togatoga/dotfiles
cp -r dotfiles ~/dotfiles
cd dotfiles
./setup.sh
```

## Link

```bash
cd dotfiles
./link.sh
```

## Info

```bash
# zplug
$ zplug install
```

## Japanese Input for Linux

### fcitx5

```bash
sudo apt install fcitx5
# overwrite
 cp fcitx5/config ~/.config/fcitx5/
```

Add fcitx5 to `gnome-tweak-tool` to start fcitx5 automatically

### xremap

```bash
cargo install xremap --features gnome
systemctl --user enable ~/.config/systemd/xremap.service
```