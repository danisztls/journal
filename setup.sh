#!/bin/sh
# Install the script to home dir

bin="$HOME/.local/bin"
config="$XDG_CONFIG_HOME/workshop"

mkdir -p "$config"
cp journal "$bin/"
cp fzf-bat-preview "$bin/"
cp journal.ignore "$config/"
cp diary "$bin/"

