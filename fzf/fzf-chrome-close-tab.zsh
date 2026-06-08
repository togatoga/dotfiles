function fzf-chrome-close-tab() {
	__fzf_require chrome-cli || return 1
	local IFS=$'\n'
	local selected=($(__fzf_chrome_tabs | fzf --prompt "[close]" --query "${LBUFFER}"))
	local line tab_id
	for line in $selected; do
		tab_id=$(__fzf_chrome_tab_id "$line")
		[ -n "$tab_id" ] && chrome-cli close -t ${tab_id}
	done
}
zle -N fzf-chrome-close-tab
#bindkey '^x^w' fzf-chrome-close-tab
