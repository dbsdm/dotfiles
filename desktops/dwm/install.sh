#!/bin/bash

LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

echo -e "\n\e[31mInstalling dwm\e[0m" 
cd ./dwm && sudo make clean install && cd ..
LINK "dwm.desktop" "/usr/share/xsessions/"
