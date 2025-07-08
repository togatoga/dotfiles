function fzf-z-search() {
	which fzf z >/dev/null
	if [ $? -ne 0 ]; then
		echo "Please install peco and z"
		return 1
	fi
	local res=$(z | sort -rn | cut -c 11- | fzf --ansi --exact --query "$LBUFFER" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
	if [ -n "$res" ]; then
		BUFFER="cd \"$res\""
		zle accept-line
	else
		return 1
	fi
	zle clear-screen
}
zle -N fzf-z-search
bindkey '^o' fzf-z-search
