# peco-chrome-history - browse chrome history
peco-chrome-history() {
	local cols sep google_history open
	cols=$((COLUMNS / 3))
	sep='{::}'

	if [ "$(uname)" = "Darwin" ]; then
		google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
		open=open
	else
		google_history="$HOME/.config/google-chrome/Default/History"
		if [ ! -e $google_history ]; then
			google_history="$HOME/.config/google-chrome/Profile 1/History"
		fi
		open=xdg-open
	fi
	cp -f "$google_history" /tmp/h
	sqlite3 -separator $sep /tmp/h \
		"select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
		awk -F $sep '{printf "%-'$cols's  %s\n", $1, $2}' |
		peco --prompt "[url]" | sed 's#.*\(https*://\)#\1#' | xargs $open >/dev/null 2>/dev/null

}
zle -N peco-chrome-history
bindkey '^[' peco-chrome-history
