#!/bin/bash

function pro() {
	dir=$(cpm list --all --recent | peco --prompt '[dir]')
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
