#!/bin/bash
# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		open .
	else
		open "$@"
	fi
}
