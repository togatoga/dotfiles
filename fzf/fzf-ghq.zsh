# Change directory to the repo where fetched by fzf
function fzf-ghq() {
	local selected_dir=$(ghq list --full-path | fzf --exact --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		__fzf_accept "cd ${selected_dir}"
	else
		zle clear-screen
	fi
}
zle -N fzf-ghq
bindkey '^j' fzf-ghq
