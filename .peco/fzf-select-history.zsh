function fzf-select-history() {
	BUFFER=$(\history -n -r 1 | fzf --query "$LBUFFER")
	CURSOR=$#BUFFER
	zle clear-screen
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history
