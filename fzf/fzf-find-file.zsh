# search file
function fzf-find-file() {
	local selected_files=$(__fzf_repo_files | fzf --exact --preview '[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (highlight -O ansi -l {} ||
                  coderay {} ||
                  rougify {} ||
                  cat {}) 2> /dev/null | head -500')

	local result='' file
	for file in $selected_files; do
		result="${result}$(echo $file | tr '\n' ' ')"
	done

	BUFFER="${BUFFER}${result}"
	CURSOR=$#BUFFER
	zle redisplay
}
zle -N fzf-find-file
bindkey '^s' fzf-find-file
