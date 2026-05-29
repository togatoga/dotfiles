#!/bin/zsh

function pro() {
	local options=""
	if [ $# -ne 0 ]; then
		options="$1"
	fi
	local dir
	dir=$(cpm list --all ${options} | fzf --prompt '[dir]')
	if [ -z "${dir}" ]; then
		return 1
	fi

	local num procon_dir
	num=$(echo "${dir}" | awk '{print NF}')
	if [ "${num}" -eq 1 ]; then
		procon_dir=$(echo "${dir}" | awk '{print $0}')
	else
		procon_dir=$(echo "${dir}" | awk '{print $NF}')
	fi
	cd "$procon_dir"
}
