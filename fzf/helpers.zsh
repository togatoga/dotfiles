#!/bin/zsh
# Shared helpers for the fzf-* widgets in this directory.
# These are plain functions (not widgets). The fzf-*.zsh files call them at
# widget-invocation time, so the order in which fzf/*.zsh is sourced does not
# matter for availability.

# Abort with a hint unless $1 is an available command (or function).
__fzf_require() {
	if ! command -v "$1" >/dev/null 2>&1; then
		echo "Please install $1"
		return 1
	fi
}

# List candidate files: tracked files inside a git repo, otherwise everything.
__fzf_repo_files() {
	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		git ls-files
	else
		find . -type f
	fi
}

# Run a command from the line editor: put it in the buffer, execute, redraw.
# Used by the "select something, then cd/checkout to it" widgets.
__fzf_accept() {
	BUFFER="$1"
	zle accept-line
	zle clear-screen
}

# Pick a container id via fzf. $1 = status filter (e.g. running, exited).
__fzf_docker_ps() {
	docker ps -a -f "status=$1" | sed -e '1d' | fzf | awk '{print $1}'
}

# Print "<tab line> <link>" rows for every open Chrome tab (macOS / chrome-cli).
__fzf_chrome_tabs() {
	local links tabs n i item=''
	local IFS=$'\n'
	links=($(chrome-cli list links | awk '{ print $2 }'))
	tabs=$(chrome-cli list tabs)
	tabs=(${=tabs})
	links=(${=links})
	n=${#tabs}
	for i in $(seq 1 ${n}); do
		item=${item}${tabs[$i]}' '${links[$i]}'\n'
	done
	echo ${item}
}

# Extract the chrome-cli tab id from a selected "[window:tab]" row.
__fzf_chrome_tab_id() {
	local id
	id=$(echo "$1" | grep -oE '\[[0-9:]*\]' | tr -d '\[\]')
	id=(${(s/:/)id})
	case ${#id[@]} in
		1) echo ${id[1]} ;;
		2) echo ${id[2]} ;;
	esac
}
