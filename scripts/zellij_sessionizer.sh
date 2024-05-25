#!/usr/bin/env bash

# Open wofi
selected_path=$(((fd . ~/code-repos/current ~/code-repos/archive ~/dotfiles --min-depth 1 --max-depth 1 --type d)&&(fd nvim ~/.config)) | wofi --dmenu -p "PROJECTS")

if [[ -z $selected_path ]]; then
    exit 0
fi

# Get the name of the selected directory, replacing "." with "_"
session_name=$(basename "$selected_path" | tr . _)

if [[ -z $ZELLIJ ]]; then
	cd $selected_path
    echo "attaching"
	zellij attach $session_name -c
	exit 0
fi

echo "creating"
zellij action write-chars "cd $selected_path" && zellij action write 10
