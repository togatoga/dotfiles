function peco-tree-cd() {
	local SELECTED_FILE=$(tree --charset=o -f -d | peco --query "$LBUFFER" | tr -d '\||`|-' | xargs echo)
	if [ "$SELECTED_FILE" != "" ]; then
		BUFFER="cd $SELECTED_FILE"
		zle accept-line
	fi

	zle reset-prompt
}

zle -N peco-tree-cd
#bindkey "^t" peco-tree-cd
