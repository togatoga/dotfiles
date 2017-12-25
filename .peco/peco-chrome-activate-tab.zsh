function peco-chrome-activate-tab() {
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
    local id=$(echo ${item}| peco --prompt "[activate]" | grep -oE '\[[0-9:]*\]' | tr -d '\[\]')
    id=(${(s/:/)id})
    size=${#id[@]}
    if [ ${size} = '1' ];then
        local tab_id=${id[1]}
        chrome-cli activate -t ${tab_id}
    elif [ ${size} = '2' ];then
        local tab_id=${id[2]}
        chrome-cli activate -t ${tab_id}
    fi
    if [ ! -z ${tab_id} ];then
        chrome-cli activate -t ${tab_id}
    fi
}
zle -N peco-chrome-activate-tab
bindkey '^\' peco-chrome-activate-tab