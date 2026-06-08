# search dir & cd
function fzf-dir-cd() {
	local selected_dir=$(__fzf_repo_files | fzf --prompt "[cd dir]" --query "${LBUFFER}")
	if [ -n "${selected_dir}" ]; then
		__fzf_accept "cd $(dirname "${selected_dir}")"
	else
		return 1
	fi
}
zle -N fzf-dir-cd
bindkey '^u' fzf-dir-cd
