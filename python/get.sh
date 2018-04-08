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
	
	git+https://github.com/togatoga/vn.git 

)

for pkg in ${PKGS[@]}; do
	pip install $pkg
done
