function fzf-chrome-activate-tab() {
    which chrome-cli > /dev/null
    if [ $? -ne 0 ];then
        echo "Please install chrome-cli"
        return 1
    fi
    IFS=$'\n'
    local links=($(chrome-cli list links | awk '{ print $2 }'))
    local tabs=$(chrome-cli list tabs)
    tabs=(${=tabs})
    links=(${=links})
    n=${#tabs}
    item=''
    for i in `seq 1 ${n}`;do
        item=${item}${tabs[$i]}' '${links[$i]}'\n'
    done
    local id=$(echo ${item}| fzf | grep -oE '\[[0-9:]*\]' | tr -d '\[\]')
    id=(${(s/:/)id})
    size=${#id[@]}
    if [ ${size} = '1' ];then
        local tab_id=${id[1]}
        chrome-cli activate -t ${tab_id}
        open -a "Google Chrome"
    elif [ ${size} = '2' ];then
        local tab_id=${id[2]}
        chrome-cli activate -t ${tab_id}
        open -a "Google Chrome"
    fi
}
zle -N fzf-chrome-activate-tab
bindkey '^\' fzf-chrome-activate-tab
