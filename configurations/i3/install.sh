#!/bin/bash

LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

echo -e "\n\e[31mInstalling i3gaps\e[0m" 

##############################################################################
#                               PACKAGES                                     #
##############################################################################

sudo pacman -S --noconfirm - < pacman.txt
yay -S --noconfirm - < yay.txt

##############################################################################
#                            CREATING LINKS                                  #
##############################################################################

LINK "i3" "$HOME/.config"
LINK "picom.conf" "$HOME/.config"
LINK "polybar" "$HOME/.config"
LINK "dunst" "$HOME/.config"
LINK "rofi" "$HOME/.config"
LINK "conky" "$HOME/.config"
