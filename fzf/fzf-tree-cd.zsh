function fzf-tree-cd() {
	local SELECTED_FILE=$(tree --charset=o -f -d | fzf --query "$LBUFFER" | tr -d '\||`|-' | xargs echo)
	if [ "$SELECTED_FILE" != "" ]; then
		BUFFER="cd $SELECTED_FILE"
		zle accept-line
	fi

	zle reset-prompt
}

zle -N fzf-tree-cd
#bindkey "^t" fzf-tree-cd
