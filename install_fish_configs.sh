#!/bin/fish

# install oh-my-fish
rm -rf $HOME/.local/share/omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install clearance
omf theme clearance

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher

# install nvm, node and npm
fisher install jorgebucaran/nvm.fish
nvm install latest
nvm use latest
