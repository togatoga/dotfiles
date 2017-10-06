################################
# Basic
################################
alias path='echo $PATH | tr -s ":" "\n"'
alias l="ls"
alias mv="mv -i"
alias cp="cp -i"

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

# Shortcuts
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"

################################
# Advanced
################################
alias gh='hub browse $(ghq list | grep "github.com" | peco --prompt "[github]" | cut -d "/" -f 2,3)'
