# Change directory where I visited before
function fzf-cdr() {
	local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf --ansi --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		__fzf_accept "cd ${selected_dir}"
	else
		zle clear-screen
	fi
}
zle -N fzf-cdr
bindkey '^t' fzf-cdr
