#!/usr/bin/env bash

scan_paths=$(fd . ~/code-repos/current ~/code-repos/archive --min-depth 1 --max-depth 1 --type d)

# absolute path only
single_paths=$(printf "$(realpath ~/dotfiles)\n$(realpath ~/.config/nvim)\n$(realpath ~/documents)")

# Open wofi
selected_path=$(printf "$scan_paths\n$single_paths" | wofi --dmenu -p "PROJECTS")

if [[ -z $selected_path ]]; then
    exit 0
fi

# Get the name of the selected directory, replacing "." with "_"
session_name=$(basename "$selected_path" | tr . _)

if [[ -z $ZELLIJ ]]; then
	cd $selected_path
    echo "attaching"
	foot zellij attach $session_name -c
	exit 0
fi

echo "creating"
foot zellij action write-chars "cd $selected_path" && zellij action write 10
