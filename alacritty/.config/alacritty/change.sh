#!/bin/zsh

[ "$INVIM" = 0 ] && cat ~/.config/alacritty/withoutVim.sample > ~/.config/alacritty/alacritty.yml
[ "$INVIM" = 1 ] && cat ~/.config/alacritty/withVim.sample > ~/.config/alacritty/alacritty.yml

exit 0
