# NVM lazy loading
# This significantly speeds up zsh startup by deferring nvm initialization
# until node/npm/nvm commands are actually used

# Disable nvm auto-use to prevent automatic loading
export NVM_AUTO_USE=false

# Placeholder function that loads nvm on first use
_lazy_load_nvm() {
    unset -f node npm npx nvm

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# Create placeholder functions for common node commands
node() {
    _lazy_load_nvm
    node "$@"
}

npm() {
    _lazy_load_nvm
    npm "$@"
}

npx() {
    _lazy_load_nvm
    npx "$@"
}

nvm() {
    _lazy_load_nvm
    nvm "$@"
}
