#!/bin/fish

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher

# install theme
fisher install dracula/fish

# install nvm, node and npm
fisher install jorgebucaran/nvm.fish
nvm install latest
nvm use latest

# install tide prompt
fisher install IlanCosman/tide@v5

# change shell
chsh -s /bin/fish db
