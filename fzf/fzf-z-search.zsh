function fzf-z-search() {
	__fzf_require fzf || return 1
	__fzf_require z || return 1
	local res=$(z | sort -rn | cut -c 11- | fzf --ansi --exact --query "$LBUFFER" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
	if [ -n "$res" ]; then
		__fzf_accept "cd \"$res\""
	else
		return 1
	fi
}
zle -N fzf-z-search
bindkey '^o' fzf-z-search
