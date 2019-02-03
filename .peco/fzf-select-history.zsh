function peco-select-history() {
	BUFFER=$(\history -n -r 1 | peco --prompt "[history]" --query "$LBUFFER")
	CURSOR=$#BUFFER
	zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
