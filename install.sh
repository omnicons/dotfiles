#!/usr/bin/env bash
DOTS_PATH=$(pwd)
printf 'Linking config files from %s\n' "$DOTS_PATH"

# foot
ln -s "$DOTS_PATH/foot" ~/.config/

# sway
ln -s "$DOTS_PATH/sway" ~/.config/

# zellij
ln -s "$DOTS_PATH/zellij" ~/.config/

# waybar
ln -s "$DOTS_PATH/waybar" ~/.config/

# wofi
ln -s "$DOTS_PATH/wofi" ~/.config/

