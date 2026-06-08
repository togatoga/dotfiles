function fzf-select-history() {
	BUFFER=$(\history -n -r 1 | fzf --prompt "[history]" --query "$LBUFFER")
	CURSOR=$#BUFFER
	zle clear-screen
}
zle -N fzf-select-history
# Ctrl-R is now handled by atuin (see .zsh/atuin.zsh). Kept here as a fallback;
# uncomment to rebind if you ever remove atuin.
#bindkey '^r' fzf-select-history
