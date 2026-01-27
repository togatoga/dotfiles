function fzf-tree-edit() {
	local SELECTED_FILE=$(tree --charset=o -f | fzf --query "$LBUFFER" | tr -d '\||`|-' | xargs echo)
	if [ "$SELECTED_FILE" != "" ]; then
		BUFFER="$EDITOR $SELECTED_FILE"
		zle accept-line
	fi

	zle reset-prompt
}

zle -N fzf-tree-edit
#bindkey "^o" fzf-tree-edit
