
# Dotfiles

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/tcnksm/dotfiles/blob/master/LICENCE)

====

# ATTENTION PLEASE

This repository is MY PERSONAL dotfiles.

Thank you for your attention.

## Quick Start

```bash
git clone https://github.com/togatoga/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

The setup script will:
- Install Homebrew packages (macOS) or apt packages (Linux)
- Set up Rust toolchain
- Install Tmux Plugin Manager
- Create symlinks to dotfiles
- Note: zinit will be auto-installed on first zsh startup

## Tools & Stack

### Shell & Plugin Management
- **Shell**: zsh
- **Plugin Manager**: [zinit](https://github.com/zdharma-continuum/zinit) (auto-installed on first startup)
- **Node Version Manager**: nvm with lazy-loading for fast startup (~0.8s)
- **Fuzzy Finder**: fzf with custom integrations

### Terminal & Editor
- **Terminal**: [Alacritty](https://alacritty.org/)
- **Multiplexer**: tmux with [TPM](https://github.com/tmux-plugins/tpm)
- **Editor**: vim

### Development Tools
- **Git**: With custom aliases and configurations
- **Languages**: Rust, Node.js (via nvm)
- **CLI Tools**: bat, ripgrep, fzf, jq, direnv, and more

## Directory Structure

```
dotfiles/
├── .zsh/              # Zsh configurations
│   ├── zinit/         # Zinit plugin manager (auto-installed)
│   ├── custom/        # Custom shell scripts
│   └── helper/        # Helper functions (including nvm-lazy.zsh)
├── fzf/               # FZF integration scripts
├── .alacritty/        # Alacritty terminal config
├── .tmux/             # Tmux configurations
├── homebrew/          # Homebrew installation scripts
├── keyboard/          # QMK/VIA keyboard layouts
├── archived/          # Archived/unused configurations
└── README.md          # This file
```

## Manual Steps

### GitHub Authentication

```bash
# Set up GitHub CLI with SSH
gh auth login ssh
gh config set -h github.com git_protocol ssh

# Verify authentication
gh auth status
ssh -T git@github.com
```

### Re-linking Dotfiles

If you need to recreate symlinks:

```bash
cd ~/dotfiles
./link.sh
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
