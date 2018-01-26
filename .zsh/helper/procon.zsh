function pro() {
	dir=$(cpm list | peco --prompt '[dir]')
	if [ -n ${dir} ];then
		echo "cd ${dir}"
		cd ${dir}
		return 1
	fi
	return 0

}
