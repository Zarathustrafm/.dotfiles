#!/bin/sh
cd ~/
echo "\n Wide upgrade and installing base-devel: \n"
sudo pacman -Syy
sudo pacman -Syu base-devel go git
sleep 1
echo "\n Installing yay: \n"
mkdir -p Downloads
cd ~/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay-git
makepkg -si
sleep 1
echo "\n Installing personal files: \n"
sleep 2
cd ~/
yay -S \
    alacritty \
    android-tools \
    android-udev \
    audacity \
    cmake \
    cmatrix \
    deluge \
    deluge-gtk \
    discord \
    ark \
    dust \
    figlet \
    filelight \
    firefox \
    flameshot \
    gamemode \
    gamescope \
    gcc \
    gnome-disk-utility \
    gparted \
    grub \
    gwenview \
    htop \
    joplin-appimage \
    java-runtime-common \
    jdk-openjdk \
    jre-openjdk \
    jre8-openjdk \
    jre \
    jdk \
    kate \
    kdenlive \
    libreoffice-fresh \
    lightdm \
    lightdm-webkit2-greeter \
    lolcat \
    lua \
    lutris \
    mlocate \
    neovim \
    networkmanager \
    npm \
    nvidia \
    nvidia-utils \
    nvidia-settings \
    nvidia-prime \
    obs-studio \
    okular \
    ranger \
    shellcheck \
    starship \
    soulseekqt \
    speedtest-cli \
    spotify \
    steam \
    stow \
    tabnine \
    tetrio-desktop \
    tor \
    torbrowser-launcher \
    vlc \
    wine \
    winetricks \
    yt-dlp \
    z \
    zathura \
    zathura-pdf-mupdf \
    zip \
    zoom \
    zsh \
    zsh-autosuggestions \
    zsh-completions \
    zsh-history-substring-search \
    todoist-appimage \
    bat \
    tauon-music-box \
    gnome-sound-recorder
