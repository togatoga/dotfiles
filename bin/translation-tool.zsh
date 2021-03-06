#!/bin/bash
# git clone https://github.com/togatoga/vn
# cd vn; "docker build -t vn ."

function docker-build-vn() {
	pushd
	rm -rf "/tmp/vn"
	git clone https://github.com/togatoga/vn /tmp/vn
	cd /tmp/vn
	git pull origin master
	docker build --no-cache=true -t vn .
	popd
}
alias vn="docker run -it --rm vn vn"
alias vni="docker run -it --rm vn vn translate --interactive"
alias vnt="docker run -it --rm vn vn translate $*"

# https://github.com/soimort/translate-shell
function translate() {
	words=$@
	result=$(is_japanese ${words})
	if [ $result -eq 1 ]; then
		trans ja:en ${words}
		return 0
	fi
	trans en:ja ${words}
}

alias tre="trans :en+ja -emacs"
alias trs="trans :en+ja -shell"
alias trc="translate"
