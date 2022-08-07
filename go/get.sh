#!/bin/bash

set -e

PKGS=(
	# General usage
	github.com/x-motemen/ghq@latest
)

for pkg in ${PKGS[@]}; do
	go install $pkg
done
