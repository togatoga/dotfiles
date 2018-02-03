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
	docker build --no-cache=true -t vn .
	popd
}
alias vn="docker run -it --rm vn python vn.py"
alias vni="docker run -it --rm vn python vn.py translate --interactive"
alias vnt="docker run -it --rm vn python vn.py translate $*"

# https://github.com/soimort/translate-shell
function translate() {
	words=$@
	result=$(is_japanese ${words})
	if [ $result -eq 1 ];then
		trans ja:eng ${words}
		return 0
	fi
	trans eng:ja ${words}
}

alias tre="trans :en+ja -emacs"
alias trs="trans :en+ja -shell"
alias trc="translate"
