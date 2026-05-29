#!/bin/zsh
# peco-like matching: --exact disables fuzzy (space-separated terms match as
# substrings, ANDed) and --no-sort preserves the input order.
export FZF_DEFAULT_OPTS='--exact --bind ctrl-k:kill-line,ctrl-v:page-down,alt-v:page-up --reverse --border --no-sort'
