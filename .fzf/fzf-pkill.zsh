function fzf-pkill() {
	for pid in $(ps aux | fzf --prompt "[fzf-pkill]" | awk '{ print $2 }'); do
		kill $pid
		echo "Killed ${pid}"
	done
}
alias pk="fzf-pkill"
