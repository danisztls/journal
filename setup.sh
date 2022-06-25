#!/bin/sh
# Setup for Journal

_findVim() {
  # Look if vim/nvim is installed and find the right place to install an after configuration
  if [ "$(command -v vim)" ] || [ "$(command -v nvim)" ]; then
    if [ "$VIMINIT" ]; then
      vimAfter=$(printf "%s\n" "$VIMINIT" | sed "s/.*runtimepath+=~\///;s/|source.*//")
    else
      vimAfter="$HOME/.vim/after"
    fi
  fi
}

doInstall() {
  # Install binaries
  binDir="$HOME/.local/bin"
  mkdir -p "$binDir"
  cp journal "$binDir/"

  # Create config dir if nonexistent
  configDir="$XDG_CONFIG_HOME/journal"
  mkdir -p "$configDir"

  # Install default ignore file if nonexistent
  [ -f "$configDir/ignore" ] || cp -n "ignore" "$configDir/" 

  # Install syntax for Vim
  _findVim
  if [ "$vimAfter" ]; then
    mkdir -p "$vimAfter"
    cp -n "syntax/journal.vim" "$vimAfter/journal.vim"
  fi
  printf "Setup completed!\n"
}

doUninstall() {
  # Remove binaries
  rm -rf "$binDir/journal"

  # Leave program data

  # Remove syntax for Vim
  _findVim
  if [ "$vimAfter" ]; then
    rm "$vimAfter/journal.vim"
  fi
}

case $1 in
  install) doInstall;;
  uninstall) doUninstall;;
esac
