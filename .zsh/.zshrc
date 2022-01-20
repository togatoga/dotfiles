# DETECT OS
if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
elif [[ $(uname) = "Linux" ]];then
    IS_LINUX=1
fi

# zsh起動時にtmux起動
#[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux
# LANG
export LANG=en_US.UTF-8

# bind key emacs
bindkey -e
alias emacs='emacs -nw'

# EDITOR
export EDITOR="vim"

########################################
# PATH
########################################
export DOTPATH=~/dotfiles
# Load zplug
source $DOTPATH/.zsh/zplug/zplug.zsh

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:${PATH}"
if [ "$(uname)" = 'Darwin' ] ; then
	export PATH="/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
    export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
	export MANPATH="/usr/local/opt/coreutilslibexec/gnuman:${MANPATH}"
	export MANPATH="/usr/local/share/man:${MANPATH}"
fi

if [ "$(uname)" = 'Linux' ]; then
    export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
	export PATH="$HOME/.linuxbrew/bin:$PATH"
	export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu/
	export OPENSSL_INCLUDE_DIR=/usr/include/openssl/
	export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
	export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
	export XDG_DATA_DIRS="$HOME/.linuxbrew/share:$XDG_DATA_DIRS"
fi
export PATH="${DOTPATH}/bin:$PATH"

typeset -U path PATH

if type "direnv" > /dev/null 2>&1; then
   eval "$(direnv hook zsh)"
fi

# Read common setting zsh
for f ($DOTPATH/.*/*.zsh) source "${f}"
for f ($DOTPATH/.zsh/helper/*.zsh) source "${f}"
for f ($DOTPATH/bin/*.zsh) source "${f}"

# Read private setting zsh
if [ -e ~/private ];then
	for f (~/private/.*/*.zsh) source "${f}"
fi

# Read company setting zsh
if [ -e ~/company ];then
	for f (~/company/utils/*.zsh) source "${f}"
fi


# use color
autoload -Uz colors
colors


# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups

# prompt
PROMPT="%{${fg[green]}%}[%n]%{${reset_color}%} %~
%# "

########################################
# vcs_info
#########################################
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
#RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
PROMPT='${vcs_info_msg_0_}'$PROMPT

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# Completion
########################################
source ~/dotfiles/.zsh/completion.zsh

########################################
# Option
########################################
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################

# cdr
autoload -Uz add-zsh-hock
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/history_path"
zstyle ':completion:*' recent-dirs-insert both
if [ ! -d "$HOME/.cache/shell/history_path" ];then
	mkdir -p $HOME/.cache/shell
	touch  $HOME/.cache/shell/history_path
fi

#less
export LESS='-R'
if [ -f /usr/local/bin/src-hilite-lesspipe.sh ];then
	export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

