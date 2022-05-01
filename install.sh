#!/bin/bash

LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

# pacman config
LINK "pacman.conf" "/etc/"

# installing essential packages
sudo pacman -Sy --noconfirm - < pacman.essentials.txt

# installing yay helper for AUR
indir=$(pwd)
sudo rm -rf /opt/yay-git
sudo git clone https://aur.archlinux.org/yay.git /opt/yay-git
sudo chown -R db:users /opt/yay-git
cd /opt/yay-git && yes | makepkg -si && cd $indir

# installing AUR packages
yay -S --noconfirm - < yay.txt

# link configs
LINK "alacritty" "$HOME/.config"
LINK "nvim" "$HOME/.config"
LINK "fish" "$HOME/.config"
LINK "mpv" "$HOME/.config"
LINK ".tmux.conf" "$HOME"

# install fish configs
fish ./install_fish_configs.sh

# change shell
chsh -s /bin/fish db

# install KDE Plasma
sudo pacman -S --noconfirm - < pacman.kde.txt
sudo systemctl enable sddm
LINK "latte" "$HOME/.config"
