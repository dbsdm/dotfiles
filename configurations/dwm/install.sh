#!/bin/bash

LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

echo -e "\n\e[31mInstalling DWM\e[0m" 

##############################################################################
#                               PACKAGES                                     #
##############################################################################

sudo pacman -S --noconfirm - < pacman.txt
yay -S --noconfirm - < yay.txt

##############################################################################
#                               BUILDING                                     #
##############################################################################

cd ./dwm && sudo make clean install && cd ..
cd ./slstatus && sudo make clean install && cd ..
cd ./dwmblocks &&  make && sudo make clean install && cd ..

##############################################################################
#                            CREATING LINKS                                  #
##############################################################################

LINK "dwm.desktop" "/usr/share/xsessions/"
LINK "picom.conf" "$HOME/.config"
LINK "dunst" "$HOME/.config"
LINK "conky" "$HOME/.config"
