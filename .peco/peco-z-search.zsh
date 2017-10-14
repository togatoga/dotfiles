function peco-z-search
{
  which peco z > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and z"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco --prompt "[dir]" --query "$LBUFFER")
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
  zle clear-screen
}
zle -N peco-z-search
bindkey '^w' peco-z-search

