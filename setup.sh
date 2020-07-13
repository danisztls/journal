#!/bin/sh
# Install the script to home dir

bin="$HOME/.local/bin" && mkdir -p "$bin"
config="$XDG_CONFIG_HOME/workshop" && mkdir -p "$config"

# Install Journal
cp journal journal-fzf diary "$bin/"
cp journal.ignore "$config/"

if [ "$VIMINIT" ]; then
	vim_after=$(echo "$VIMINIT" | sed "s/.*runtimepath+=~\///;s/|source.*//") && vim_after="$HOME/$vim_after"
else
	vim_after="$HOME/.vim/after"
fi

mkdir -p "$vim_after" && cp "syntax/markdown.vim" "$vim_after/syntax/markdown.vim"
