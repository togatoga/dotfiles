# Change directory to the repo where fetched by peco
function fzf-ghq() {
	local selected_dir=$(ghq list --full-path | fzf --exact --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}
zle -N fzf-ghq
bindkey '^j' fzf-ghq
