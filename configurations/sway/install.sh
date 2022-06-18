#!/bin/bash

LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

echo -e "\n\e[31mInstalling sway\e[0m" 

##############################################################################
#                               PACKAGES                                     #
##############################################################################

sudo pacman -S --noconfirm - < pacman.txt
yay -S --noconfirm - < yay.txt

##############################################################################
#                            CREATING LINKS                                  #
##############################################################################

LINK "sway" "$HOME/.config"
LINK "dunst" "$HOME/.config"
LINK "waybar" "$HOME/.config"
