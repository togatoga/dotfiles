#!/bin/bash
# git clone https://github.com/togatoga/vn
# cd vn; "docker build -t vn ."

function docker-build-vn() {
	pushd
	if [ ! -d "/tmp/vn" ]; then
		git clone https://github.com/togatoga/vn /tmp/vn
	fi
	cd /tmp/vn
	git pull origin master
	docker build -t vn .
	popd
}

alias vnt="docker run -it --rm vn python vn.py translate $*"
