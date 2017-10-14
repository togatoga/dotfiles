function peco-pkill() {
for pid in `ps aux | peco --prompt "[peco-pkill]" | awk '{ print $2 }'`
do
	kill $pid
	echo "Killed ${pid}"
done
}
alias pk="peco-pkill"
