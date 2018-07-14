#!/bin/bash

packages=(
	rustfmt
	racer
	bat
)

for pkg in ${packages[@]}; do
	cargo install --force $pkg
done
