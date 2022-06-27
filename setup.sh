#!/bin/sh

cd ~/.dotfiles/

echo "\n Installing fundamental packages: \n"
sleep 2
sh ./install.sh

echo "\n Making ZSH default: \n"
sleep 2
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER
touch ~/.zshenv ~/.zprofile ~/.zshrc ~/.zlogin

echo "\n Stow dot files: \n"
sleep 2
cd ~/.dotfiles/
stow alacritty 
stow easyeffects 
stow nvim 
stow starship 
stow vim 
stow zsh

echo "\n Intalling vim-plug: \n"
sleep 2
sh -c 'curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
