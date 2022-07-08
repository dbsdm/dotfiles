#!/bin/bash

LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

##############################################################################
#                       INSTALLING ESSENTIAL PACKAGES                        #
##############################################################################

LINK "pacman.conf" "/etc/"
sudo pacman -Sy --noconfirm libinih # missing pgp key :/
sudo pacman -Sy --noconfirm - < pacman.txt

##############################################################################
#                           INSTALLING AUR HELPER                            #
##############################################################################

temp=$(pwd)
rm -rf ~/yay-git
git clone https://aur.archlinux.org/yay.git ~/yay-git
cd ~/yay-git && yes | makepkg -si && cd $temp && rm -rf ~/yay-git

##############################################################################
#                          INSTALLING AUR PACKAGES                           #
##############################################################################

yay -S --noconfirm - < yay.txt

##############################################################################
#                           INSTALLING DOOM EMACS                            #
##############################################################################

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

##############################################################################
#                              LINKING CONFIGS                               #
##############################################################################

mkdir $HOME/.config
LINK "alacritty" "$HOME/.config"
LINK "kitty" "$HOME/.config"
LINK "nvim" "$HOME/.config"
LINK "fish" "$HOME/.config"
LINK "mpv" "$HOME/.config"
LINK "ranger" "$HOME/.config"
LINK "zathura" "$HOME/.config"
LINK "tmux" "$HOME/.config"
LINK "rtorrent" "$HOME/.config"
LINK "git" "$HOME/.config"
LINK "mpd" "$HOME/.config"
LINK "mpd-notification.conf" "$HOME/.config"
mkdir ~/.config/mpd/playlists
touch ~/.config/mpd/database
touch ~/.config/mpd/state
touch ~/.config/mpd/pid

##############################################################################
#                                  SYSTEMD                                   #
##############################################################################

sudo systemctl enable ly
sudo systemctl enable cups
sudo systemctl enable libvirtd
systemctl enable --user mpd
systemctl enable --user mpd-notification
systemctl enable --user emacs

##############################################################################
#                           DEFAULT APPLICATIONS                             #
##############################################################################

xdg-mime default org.pwmt.zathura.desktop application/pdf
