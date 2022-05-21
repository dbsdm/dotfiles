#!/bin/fish

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher # fisher plugin manager itself

# plugins
fisher install dracula/fish # dracula theme for fish
fisher install IlanCosman/tide@v5 # tide prompt, fast, git support
fisher install franciscolourenco/done # notifications for long procs, when done
fisher install jethrokuan/z # z port for fish, frecency folder matching
fisher install joseluisq/gitnow # git helper, see commands on github

# install nvm, node and npm
fisher install jorgebucaran/nvm.fish # nvm integration for fish
nvm install latest # install latest node

# change shell
chsh -s /bin/fish db
