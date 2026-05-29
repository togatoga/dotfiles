#!/bin/bash
#
# See more info at https://github.com/tmux-plugins/tpm

set -euo pipefail

if [ -d ~/.tmux/plugins/tpm ]; then
    echo "✓ tpm already installed"
    exit 0
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
