function peco-chrome-activate-tab() {
    which chrome-cli > /dev/null
    if [ $? -ne 0 ];then
        echo "Please install chrome-cli"
        return 1
    fi
    local tab_id=$(chrome-cli list tabs | peco --prompt "[tab]" | grep -oE '\[[0-9]*\]' | tr -d '\[\]')
    chrome-cli activate -t ${tab_id}
}
zle -N peco-chrome-activate-tab
bindkey '^\' peco-chrome-activate-tab