#!/bin/bash

function pro() {
	declare options
	options=''
	if [ $# -ne 0 ]; then
		options="$1"
	fi
	dir=$(cpm list --all ${options} | fzf --prompt '[dir]')
	if [ -n ${dir} ]; then
		num=$(echo ${dir} | awk '{print NF}')
		if [ ${num} -eq 1 ]; then
			procon_dir=$(echo ${dir} | awk '{print $0}')
		else
			procon_dir=$(echo ${dir} | awk '{print $NF}')
		fi
		cd $procon_dir
		return 1
	fi
	return 0
}
