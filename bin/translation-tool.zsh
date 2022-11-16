#!/bin/bash
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
