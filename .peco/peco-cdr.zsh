# Change directory where I visited before
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco --prompt '[cdr]' --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^o' peco-cdr

