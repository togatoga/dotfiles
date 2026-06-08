#!/bin/bash
#
# Install atuin (SQLite-backed shell history) to ~/.local/bin and import the
# existing shell history. Idempotent: no-ops if atuin is already on PATH.
# The zsh integration lives in .zsh/atuin.zsh.

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

if command -v atuin &>/dev/null; then
    ok "atuin already installed ($(atuin --version))"
    exit 0
fi

# macOS: prefer Homebrew so updates flow through brew.
if is_mac; then
    if command -v brew &>/dev/null; then
        info "Installing atuin via Homebrew..."
        brew install atuin
        ok "atuin installed"
    else
        warn "Homebrew not found; skipping atuin"
    fi
    exit 0
fi

# Linux: drop a prebuilt binary into ~/.local/bin (already on PATH via .zshrc).
case "$(uname -m)" in
    x86_64)        target='x86_64-unknown-linux-gnu' ;;
    aarch64|arm64) target='aarch64-unknown-linux-gnu' ;;
    *)             warn "Unsupported arch $(uname -m); skipping atuin"; exit 0 ;;
esac

tag=$(curl -fsSL https://api.github.com/repos/atuinsh/atuin/releases/latest \
        | grep -m1 '"tag_name"' | cut -d '"' -f4)
if [ -z "$tag" ]; then
    warn "Could not resolve latest atuin version; skipping"
    exit 0
fi

info "Installing atuin $tag ($target)..."
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
curl -fsSL "https://github.com/atuinsh/atuin/releases/download/${tag}/atuin-${target}.tar.gz" \
    -o "$tmp/atuin.tar.gz"
tar xzf "$tmp/atuin.tar.gz" -C "$tmp"
bin=$(find "$tmp" -type f -name atuin | head -1)
mkdir -p "$HOME/.local/bin"
install -m 755 "$bin" "$HOME/.local/bin/atuin"
ok "atuin installed to ~/.local/bin/atuin"

# Seed the atuin DB from existing zsh history (atuin dedupes on import).
if [ -f "$HOME/.zsh_history" ]; then
    info "Importing existing shell history into atuin..."
    HISTFILE="$HOME/.zsh_history" "$HOME/.local/bin/atuin" import auto || warn "atuin import failed"
fi
