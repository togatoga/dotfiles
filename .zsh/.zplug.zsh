#zplug
source ~/.zplug/init.zsh

# syntax
zplug "chrissicool/zsh-256color", defer:2
zplug "Tarrasch/zsh-colors", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "ascii-soup/zsh-url-highlighter", defer:2

# completions
zplug "zsh-users/zsh-completions", defer:2

#emoji
zplug "b4b4r07/emoji-cli", as:command

# 未インストール項目をインストールする
if ! zplug check --verbose; then
	printf "Install? [Y/n]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load --verbose
