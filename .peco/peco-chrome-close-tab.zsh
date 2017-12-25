function peco-chrome-close-tab() {
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
    
    local item=($(echo ${item} | peco --prompt "[close]" --query "${LBUFFER}"))
    
	for id in $item;
    do
        
        id=$(echo ${id} | grep -oE '\[[0-9:]*\]' | tr -d '\[\]')
        id=(${(s/:/)id})
        size=${#id[@]}
        if [ ${size} = '1' ];then
            local tab_id=${id[1]}
            chrome-cli close -t ${tab_id}
        elif [ ${size} = '2' ];then
            local tab_id=${id[2]}
            chrome-cli close -t ${tab_id}
        fi
	done
}
zle -N peco-chrome-close-tab
bindkey '^w' peco-chrome-close-tab
