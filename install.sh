#!/bin/bash

LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

# select desktop
echo -e "Available desktops:\n"
desktops=`ls ./desktops/`
for folder in $desktops
do
    echo -e "\t$folder"
done

echo -e "\tminimal (no desktop)\n"
read -p "Which desktop should be installed? " desktop

correct=false
for folder in $desktops
do
    if [ $folder == $desktop ]; then
        correct=true
    fi
done

if [ $desktop == "minimal" ]; then
    correct=true
fi
if [ $correct == false ]; then
    echo -e "\n\e[31mInvalid choice.\e[0m"
    exit
fi

echo -e "\n\e[32mDesktop will be installed: $desktop\e[0m"
sleep 3

# pacman config
LINK "pacman.conf" "/etc/"

# installing essential packages
sudo pacman -Sy --noconfirm libinih # missing pgp key :/
sudo pacman -Sy --noconfirm - < pacman.txt

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
LINK "kitty" "$HOME/.config"
LINK "nvim" "$HOME/.config"
LINK "fish" "$HOME/.config"
LINK "mpv" "$HOME/.config"
LINK "ranger" "$HOME/.config"
LINK "zathura" "$HOME/.config"
LINK ".themes" "$HOME"
LINK ".icons" "$HOME"
LINK ".tmux.conf" "$HOME"
LINK ".gitconfig" "$HOME"

# mpd setup
LINK "mpd" "$HOME/.config"
touch ~/.config/mpd/database
touch ~/.config/mpd/state
touch ~/.config/mpd/pid
mkdir ~/.config/mpd/playlists
LINK "mpd-notification.conf" "$HOME/.config"

# playerctl daemon
mkdir -p ~/.config/systemd/user
LINK "playerctld.service" "$HOME/.config/systemd/user/"

# systemd setup
sudo systemctl enable ly
sudo systemctl enable cups
sudo systemctl enable libvirtd
systemctl enable --user mpd
systemctl enable --user mpd-notification
systemctl enable --user playerctld

# default applications
bash ./default-apps.sh

# installing selected desktop
if [ $desktop == "none" ]; then
    fish ./fish.sh
    echo -e "\n\e[32mInstallation finished without errors.\e[0m"
    exit
else
    cd ./desktops/$desktop/
    bash ./install.sh
    cd ../..
    fish ./fish.sh
    echo -e "\n\e[32mInstallation finished without errors.\e[0m"
fi
