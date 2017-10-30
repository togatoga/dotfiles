################################
# Basic
################################
alias reload='exec $SHELL -l'
alias path='echo $PATH | tr -s ":" "\n"'
alias ls="ls --color -F"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias mv="mv -i"
alias cp="cp -i"

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias ccat="ccat --color=always --bg=dark"

# Shortcuts
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"

################################
# Advanced
################################
alias e="emacs"
alias gh='hub browse $(ghq list | grep "github.com" | peco --prompt "[github]" | cut -d "/" -f 2,3)'
alias gist="gist -c -o -p"
