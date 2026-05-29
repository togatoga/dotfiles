#!/bin/bash

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

if ! is_linux; then
    exit 0
fi

# Add the current user to the docker group so docker runs without sudo.
sudo groupadd -f docker
sudo usermod -aG docker "$USER"
sudo systemctl restart docker.service
