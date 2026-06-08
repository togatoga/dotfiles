function fzf-chrome-activate-tab() {
	__fzf_require chrome-cli || return 1
	local sel tab_id
	sel=$(__fzf_chrome_tabs | fzf)
	tab_id=$(__fzf_chrome_tab_id "$sel")
	if [ -n "$tab_id" ]; then
		chrome-cli activate -t ${tab_id}
		open -a "Google Chrome"
	fi
}
zle -N fzf-chrome-activate-tab
bindkey '^\' fzf-chrome-activate-tab
