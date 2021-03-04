#!/bin/sh
# Script to install/uninstall Journal

doInstall () {
    # Install binaries
	bin="$HOME/.local/bin" && mkdir -p "$bin" && cp journal jfzf "$bin/"
    
    # Create config dir if not existent
    config="$XDG_CONFIG_HOME/journal" && mkdir -p "$config"
    [ -f "$config/ignore" ] || echo -e "log/journal.md\nlog/backlog.md" > "$config/ignore" 

    # Install syntax for vim
	if [ "$VIMINIT" ]; then
		vim_after=$(echo "$VIMINIT" | sed "s/.*runtimepath+=~\///;s/|source.*//") && vim_after="$HOME/$vim_after"
	else
		vim_after="$HOME/.vim/after"
	fi

	mkdir -p "$vim_after" && cp "syntax/markdown.vim" "$vim_after/syntax/markdown.vim"

    echo "Setup completed!"
}

# TODO: Write a uninstall script
#doUninstall () {
#}

case $1 in
	install) doInstall;;
	# uninstall) doUninstall;;
esac

