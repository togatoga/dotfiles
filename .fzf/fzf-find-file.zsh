# search file
function fzf-find-file() {
	if git rev-parse 2>/dev/null; then
		source_files=$(git ls-files)
	else
		source_files=$(find . -type f)
	fi
	selected_files=$(echo $source_files | fzf --exact --preview '[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (highlight -O ansi -l {} ||
                  coderay {} ||
                  rougify {} ||
                  cat {}) 2> /dev/null | head -500')

	result=''
	for file in $selected_files; do
		result="${result}$(echo $file | tr '\n' ' ')"
	done

	BUFFER="${BUFFER}${result}"
	CURSOR=$#BUFFER
	zle redisplay
}
zle -N fzf-find-file
bindkey '^s' fzf-find-file
