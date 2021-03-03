#!/bin/sh
# Script to install/uninstall Journal

doInstall () {
	bin="$HOME/.local/bin" && mkdir -p "$bin"
	config="$XDG_CONFIG_HOME/journal" && mkdir -p "$config"
	
	cp journal jfuzz "$bin/"
	cp journal.ignore "$config/"

	if [ "$VIMINIT" ]; then
		vim_after=$(echo "$VIMINIT" | sed "s/.*runtimepath+=~\///;s/|source.*//") && vim_after="$HOME/$vim_after"
	else
		vim_after="$HOME/.vim/after"
	fi

	mkdir -p "$vim_after" && cp "syntax/markdown.vim" "$vim_after/syntax/markdown.vim"

    echo "All done!"
}

#doUninstall () {
#}

case $1 in
	install) doInstall;;
	# uninstall) doUninstall;;
esac

