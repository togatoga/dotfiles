################################
# Basic
################################

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
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
