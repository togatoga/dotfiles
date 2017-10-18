function peco-tree() {
    local SELECTED_FILE=$(tree --charset=o -f | peco --query "$LBUFFER" | tr -d '\||`|-' | xargs echo)
    if [ "$SELECTED_FILE" != "" ]; then
	BUFFER="$EDITOR $SELECTED_FILE"
	zle accept-line
    fi

    zle reset-prompt
}

zle -N peco-tree
bindkey "^t" peco-tree
