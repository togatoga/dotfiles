#!/bin/bash
#
# Shared helpers for the setup/install/link scripts.
# Source this from any script:  source "<dotfiles>/lib/common.sh"

# Resolve the dotfiles repository root from this file's location, so scripts
# work regardless of the current working directory.
DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export DOTFILES_ROOT

# OS detection (single source of truth).
case "$(uname)" in
    Darwin) DOTFILES_OS='mac' ;;
    Linux)  DOTFILES_OS='linux' ;;
    *)      DOTFILES_OS='unknown' ;;
esac
export DOTFILES_OS

is_mac()   { [ "$DOTFILES_OS" = 'mac' ]; }
is_linux() { [ "$DOTFILES_OS" = 'linux' ]; }

# Logging helpers.
info() { printf '\033[34m==>\033[0m %s\n' "$*"; }
ok()   { printf '\033[32m✓\033[0m %s\n' "$*"; }
warn() { printf '\033[33m⚠\033[0m %s\n' "$*"; }

# Yes/No prompt.  Usage: confirm "Question?" [Y|N]
#   - Second arg is the default when the user just presses Enter (default: Y).
#   - Returns 0 for yes, 1 for no.
confirm() {
    local default="${2:-Y}" ans
    if [ "$default" = 'Y' ]; then
        printf '%s [Y/n]: ' "$1"
    else
        printf '%s [y/N]: ' "$1"
    fi
    read -r ans
    [ -z "$ans" ] && ans="$default"
    case "$ans" in
        [Yy]*) return 0 ;;
        *)     return 1 ;;
    esac
}
