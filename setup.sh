#!/bin/sh

# Install my fundamental packages
sh ./install.sh

# Make zsh default
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER
touch ~/.zshenv ~/.zprofile ~/.zshrc ~/.zlogin

# Stow dot files
stow alacritty 
stow easyeffects 
stow nvim 
stow starship 
stow vim 
stow zsh

# Install vim-plug
sh -c 'curl -fLo $$HOME/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install nvim plugins
nvim --headless +PlugInstall +qall
