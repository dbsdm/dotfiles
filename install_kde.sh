
LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

# install KDE Plasma
sudo pacman -S --noconfirm - < pacman.kde.txt
sudo systemctl enable sddm
LINK "latte" "$HOME/.config"
