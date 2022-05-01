#!/bin/bash

LINK(){
    rm -rf $2/$1
    ln -sf $(pwd)/$1 $2
}

# pacman config
LINK "pacman.conf" "/etc/"

# installing essential packages
pacman -S --needed --noconfirm - < pacman.essentials.txt

# installing yay helper for AUR
indir=$(pwd)
git clone https://aur.archlinux.org/yay.git /opt/yay-git
chown -R db:users /opt/yay-git
cd /opt/yay-git | makepkg -si | cd $indir

# installing AUR packages
yay -S --noconfirm - < yay.txt

# prompt for KDE install
read -p "Install KDE Plasma desktop? (y/n): " answer
if [$answer == "y"]; then
    pacman -S --noconfirm - < pacman.kde.txt
    cp -r ./latte $HOME/.config/
fi

# link configs
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
