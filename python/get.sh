#!/bin/bash

set -e

echo "installed...python lib"
PKGS=(
	#general
	virtualenv

	#cli
	click
	#color print
	crayons
	# formatter
	yapf

)

for pkg in ${PKGS[@]}; do
	pip install $pkg
done
