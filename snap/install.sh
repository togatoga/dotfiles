#!/bin/bash

packages=(
	#go
	go
)
for pkg  in ${packages[@]};
do
	sudo snap install -y $pkg
done
