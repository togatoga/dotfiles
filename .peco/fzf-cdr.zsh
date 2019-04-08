# Change directory where I visited before
function fzf-cdr() {
	local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf --ansi --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}
zle -N fzf-cdr
bindkey '^t' fzf-cdr
