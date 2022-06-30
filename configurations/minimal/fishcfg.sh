#!/bin/fish

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source

fisher install jorgebucaran/fisher               # fisher plugin manager
fisher install fisher install IlanCosman/tide@v5 # better prompt
fisher install franciscolourenco/done            # notification when task done
fisher install jethrokuan/z                      # z port
fisher install joseluisq/gitnow                  # git helper
fisher install jorgebucaran/nvm.fish             # nvm for fish

# installing poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

chsh -s /bin/fish db
