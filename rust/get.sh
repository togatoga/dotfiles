#!/bin/bash

packages=(
	rustfmt
	racer
)

for pkg in ${packages[@]}; do
	cargo install --force $pkg
done
