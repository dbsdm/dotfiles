
LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

# install KDE Plasma
sudo pacman -S --noconfirm - < pacman.i3.txt
yay -S --noconfirm - < yay.i3.txt
sudo systemctl enable sddm
LINK "i3" "$HOME/.config"
LINK "picom.conf" "$HOME/.config"
LINK "polybar" "$HOME/.config"
LINK "rofi" "$HOME/.config"
