#!/bin/bash

# installing essential packages
pacman -S --needed --noconfirm - < pacman.essentials.txt

# installing yay helper for AUR
cd /opt
git clone https://aur.archlinux.org/yay.git
chown -R db:users ./yay
cd yay
makepkg -si

# installing AUR packages
yay -S --noconfirm - < yay.txt

# prompt for KDE install
read -p "Install KDE Plasma desktop? (y/n): " answer
if [$answer == "y"]; then
    pacman -S --noconfirm - < pacman.kde.txt
    cp -r ./latte $HOME/.config/
fi

# link configs
LINK(){
    rm -rf $2/$1
    ln -sf $(pwd)/$1 $2
}

LINK "alacritty" "$HOME/.config"
LINK "nvim" "$HOME/.config"
LINK "fish" "$HOME/.config"
LINK "mpv" "$HOME/.config"

# apply additional configurations for fish shell
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
omf install clearance

# install node and npm
fish ./install_node.sh

# change shell
chsh -s /bin/fish db
