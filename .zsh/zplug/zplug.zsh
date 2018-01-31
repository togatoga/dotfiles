#zplug
source ~/.zplug/init.zsh

# syntax
zplug "chrissicool/zsh-256color", defer:2
zplug "Tarrasch/zsh-colors", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "ascii-soup/zsh-url-highlighter", defer:3

# completions
zplug "zsh-users/zsh-completions", defer:2

# autosuggestions
zplug "zsh-users/zsh-autosuggestions", defer:2
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'



# bookmark
zplug "jocelynmallon/zshmarks", defer:1

# theme
#zplug mafredri/zsh-async, from:github
#zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# autoenv
zplug "Tarrasch/zsh-autoenv"

# Tracks your most used directories, based on 'frecency'.
zplug "rupa/z", use:"*.sh"

# enhanced
zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_COMMAND=ed

# 未インストール項目をインストールする
#if ! zplug check --verbose; then
#	printf "Install? [Y/n]: "
#	if read -q; then
#		echo; zplug install
#	fi
#fi

zplug load
