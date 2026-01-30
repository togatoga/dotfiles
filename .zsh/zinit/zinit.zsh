# zinit
# Install zinit if not installed
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Load plugins

# syntax highlighting and colors
zinit ice wait'0a' lucid
zinit light chrissicool/zsh-256color

zinit ice wait'0a' lucid
zinit light Tarrasch/zsh-colors

zinit ice wait'0a' lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait'0b' lucid
zinit light ascii-soup/zsh-url-highlighter

# completions
zinit ice wait'0a' lucid blockf
zinit light zsh-users/zsh-completions

# autosuggestions
zinit ice wait'0a' lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# bookmark
zinit ice wait'0' lucid
zinit light jocelynmallon/zshmarks

# autoenv
zinit light Tarrasch/zsh-autoenv

# Tracks your most used directories, based on 'frecency'.
zinit light agkozak/zsh-z

# Optional: Compile zinit for better performance
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
