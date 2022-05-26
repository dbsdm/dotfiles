#!/bin/fish

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source

fisher install jorgebucaran/fisher      # fisher plugin manager
fisher install pure-fish/pure           # better prompt
fisher install franciscolourenco/done   # notification when task done
fisher install jethrokuan/z             # z port
fisher install joseluisq/gitnow         # git helper
fisher install jorgebucaran/nvm.fish    # nvm for fish

chsh -s /bin/fish db
