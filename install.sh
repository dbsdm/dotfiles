#!/bin/bash

LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

# desktop options
read -p "Which desktop to install(1-none 2-i3gaps 3-KDE Plasma): " desktop

if [ -z "$desktop" ] 
then 
    echo 'Choose at least one option!' 
    exit 0 
fi

if ! [[ "$desktop" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] 
then 
    echo "Enter a number." 
    exit 0 
fi

if [[ "$desktop" != 1 ]] && [[ "$desktop" != 2 ]] && [[ "$desktop" != 3 ]]
then 
    echo "Invalid option." 
    exit 0 
fi

# pacman config
LINK "pacman.conf" "/etc/"

# installing essential packages
sudo pacman -Sy --noconfirm libinih
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
LINK "ranger" "$HOME/.config"
LINK ".tmux.conf" "$HOME"
LINK ".gitconfig" "$HOME"

#installing selected desktop
if [[ "$desktop" == 2 ]]
then
    echo "### Installing i3gaps" 
    sudo pacman -S --noconfirm - < pacman.i3.txt
    yay -S --noconfirm - < yay.i3.txt
    sudo systemctl enable sddm
    LINK "i3" "$HOME/.config"
    LINK "picom.conf" "$HOME/.config"
    LINK "polybar" "$HOME/.config"
    LINK "rofi" "$HOME/.config"
elif [[ "$desktop" == 3 ]]
then
    echo "### Installing KDE" 
    sudo pacman -S --noconfirm - < pacman.kde.txt
    sudo systemctl enable sddm
    LINK "latte" "$HOME/.config"
fi

# install oh-my-fish
rm -rf $HOME/.local/share/omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
