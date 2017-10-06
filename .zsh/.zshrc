# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

########################################
# PATH
########################################
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export DOTPATH=~/dotfiles

# Read common setting zsh
for f ($DOTPATH/.*/*.zsh) source "${f}"
for f ($DOTPATH/.zsh/helper/*.zsh) source "${f}"

# Load zplug
source $DOTPATH/.zsh/zplug/.zplug.zsh

# Read private setting zsh
if [ -e ~/private ];then
	for f (~/private/.*/*.zsh) source "${f}"
fi

# Read company setting zsh
if [ -e ~/company ];then
	for f (~/company/.*/*.zsh) source "${f}"
fi



# enviroment
export LANG=ja_JP.UTF-8

# zsh起動時にtmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux

# use color
autoload -Uz colors
colors

# key bind emacs
bindkey -e

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
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

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
case ${OSTYPE} in
    darwin*)
	#Mac用の設定
	export CLICOLOR=1
	alias ls='ls -G -F'
	;;
    linux*)
	#Linux用の設定
	alias ls='ls -F --color=auto'
	;;
esac

# cdr
autoload -Uz add-zsh-hock
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
