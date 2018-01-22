function peco-chrome-bookmark() {
	chrome-bookmark.rb
}
zle -N peco-chrome-bookmark
bindkey '^]' peco-chrome-bookmark
