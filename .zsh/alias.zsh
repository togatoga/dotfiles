################################
# Basic
################################
alias rm='rmtrash'
alias mv="mv -i"
alias cp="cp -i"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

################################
# Advanced
################################
alias gh='hub browse $(ghq list | grep "github.com" | peco --prompt "[github]" | cut -d "/" -f 2,3)'
