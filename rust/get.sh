#!/bin/bash

packages=(
	rustfmt
	racer
	bat
)

for pkg in ${packages[@]}; do
	cargo +nightly install --force $pkg
done
