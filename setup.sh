#!/bin/sh
# Script to install/uninstall Journal

doInstall () {
    # Install binaries
	bin="$HOME/.local/bin" && mkdir -p "$bin" && cp journal "$bin/"
    
    # Create config dir if not existent
    config="$XDG_CONFIG_HOME/journal" && mkdir -p "$config"
    
    # Create default ignore file if non existent
    [ -f "$config/ignore" ] || printf "log/journal.md\nlog/backlog.md\nlog/backlog-old.md\n" > "$config/ignore" 

    # Install syntax for vim
	if [ "$VIMINIT" ]; then
		vim_after=$(printf "$VIMINIT\n" | sed "s/.*runtimepath+=~\///;s/|source.*//") && vim_after="$HOME/$vim_after"
	else
		vim_after="$HOME/.vim/after"
	fi
	mkdir -p "$vim_after" && cp "syntax/markdown.vim" "$vim_after/syntax/markdown.vim"

    printf "Setup completed!\n"
}

# TODO: Write a uninstall script
#doUninstall () {
#}

case $1 in
	install) doInstall;;
	# uninstall) doUninstall;;
esac

