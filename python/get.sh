#!/bin/bash

set -e

echo "installed...python lib"
PKGS=(
	#cli lib
	click
	#color
	crayons

)

for pkg in ${PKGS[@]}; do
	pip install $pkg
done
