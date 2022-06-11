#         _              
# _______| |__  _ __ ___ 
#|_  / __| '_ \| '__/ __|
# / /\__ \ | | | | | (__ 
#/___|___/_| |_|_|  \___|
#                        
#

# Functions
refreshTerminalConfig() {
    zsh ~/.config/alacritty/change.sh
}
toVim() {
    npm init -y &> /dev/null 
    touch version
    INVIM=1
    refreshTerminalConfig
    nvim $1
    INVIM=0
    refreshTerminalConfig
    [[ -e ./version ]] && rm version
    [[ -e ./package.json ]] && rm package.json
    [[ -e ./tabnine_rCURRENT.log ]] && rm tabnine_rCURRENT.log
}

# ENV Variables
PATH=/home/zarathustra/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/home/zarathustra/.dotnet/tools:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:/home/zarathustra/.scripts
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
declare -x INVIM=0

#Init
refreshTerminalConfig
USE_POWERLINE="true"
[[ -e ~/.zsh-basic-conf ]] && source ~/.zsh-basic-conf
[[ -e ~/.zsh-theme-conf ]] && source ~/.zsh-theme-conf

# Aliases
alias pq="pacman -Q | grep"
alias yss="yay -Ss"
alias ysu="yay -Syu"
alias ys="yay -S"
alias la="ls -a"
alias ll="ls -l"
alias rm="rm -vrf"
alias sn="shutdown now"
alias rb="reboot"
alias q="exit"
alias du="dust"
alias vim=toVim
alias cg="cd ~/.config"
alias cgnv="cd ~/.config/nvim && ls"
alias cat="bat"

. /usr/share/z/z.sh     # For z to work properly
eval "$(starship init zsh)"     # Prompt
xset r rate 195 23
