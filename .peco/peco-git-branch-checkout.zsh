function peco-git-branch-checkout() {
	local selected_branch_name="$(git branch -a | peco | tr -d ' ')"
	case "$selected_branch_name" in
	*-\>*)
		selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*->(.*?)\/(.*)$/\2/;print')"
		;;
	remotes*)
		selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*?remotes\/(.*?)\/(.*)$/\2/;print')"
		;;
	esac
	if [ -n "$selected_branch_name" ]; then
		BUFFER="git checkout ${selected_branch_name}"
		zle accept-line
	fi
	zle clear-screen
}
zle -N peco-git-branch-checkout
bindkey '^x^b' peco-git-branch-checkout
