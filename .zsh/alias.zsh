################################
# Basic
################################
alias reload='exec $SHELL -l'
alias path='echo $PATH | tr -s ":" "\n"'

alias ls="ls --color -F"
alias ks="ls"
alias sl="ls"
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
alias v="vim"
alias vi="vim"
alias gist="gist -c -o -p"

# weather
alias wx="curl -4 wttr.in/Tokyo"
if [ "$(uname)" = 'Linux' ]; then
	alias pbcopy='xclip -selection c'
	alias pbpaste='xclip -o'
	alias open='xdg-open 2>/dev/null'
else
	alias grep="ggrep"
fi
