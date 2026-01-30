# search dir & cd
function fzf-dir-cd() {
	if git rev-parse 2>/dev/null; then
		source_dirs=$(git ls-files)
	else
		source_dirs=$(find . -type f)
	fi
	selected_dir=$(echo $source_dirs | fzf --prompt "[cd dir]" --query "${LBUFFER}")
	if [ -n "${selected_dir}" ]; then
		selected_dir=$(dirname "${selected_dir}")
		BUFFER="cd ${selected_dir}"
		zle accept-line
	else
		return 1
	fi
	zle clear-screen
}
zle -N fzf-dir-cd
bindkey '^u' fzf-dir-cd
