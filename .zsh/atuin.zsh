# atuin - SQLite-backed shell history with fuzzy search & full multiline support.
# Replaces Ctrl-R. The old fzf-select-history Ctrl-R binding is disabled in
# fzf/fzf-select-history.zsh so atuin wins (fzf/*.zsh is sourced after .zsh/*.zsh).
# --disable-up-arrow keeps the plain zsh up-arrow behavior; only Ctrl-R is taken over.
if command -v atuin >/dev/null 2>&1; then
	eval "$(atuin init zsh --disable-up-arrow)"
fi
