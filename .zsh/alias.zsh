################################
# Basic
################################
alias reload='exec $SHELL -l'
alias path='echo $PATH | tr -s ":" "\n"'
alias ks="ls"
alias sl="ls"
alias ls="ls --color -F"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias mv="mv -i"
alias cp="cp -i"
alias g="git"
alias t="tmux"

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias ccat="ccat --color=always --bg=dark"
alias today="date +%Y%m%d"

# Shortcuts
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"

################################
# Advanced
################################
alias e="emacs"
alias v="vim"
alias gh='hub browse $(ghq list | grep "github.com" | peco --prompt "[github]" | cut -d "/" -f 2,3)'
alias gist="gist -c -o -p"

# weather
alias wx="curl -4 wttr.in/Tokyo"
