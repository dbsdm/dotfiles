##############################################################################
#                                FISH CONFIG                                 #
##############################################################################

set fish_greeting
fish_vi_key_bindings

##############################################################################
#                                ENVIRONMENT                                 #
##############################################################################

set EDITOR "nvim"    
set VISUAL "nvim" 
set -gx VIRTUAL_ENV_DISABLE_PROMPT 0
set -gx QT_STYLE_OVERRIDE kvantum
set -gx nvm_default_version latest
set -gx PATH "$HOME/.cargo/bin/" $PATH
set -gx PATH "$HOME/.local/bin/" $PATH
set -gx PATH "$HOME/.emacs.d/bin/" $PATH
set -gx PATH "$HOME/dotfiles/configurations/minimal/bm-scripts/" $PATH
set -gx BEMENU_OPTS '-i -b -H 20 --fn "JetBrainsMono Nerd Font 10" --tb "#000000" --tf "#ffffff" --fb "#000000" --ff "#ffffff" --nb "#000000" --nf "#ffffff" --hb "#000000" --hf "#00ff00"'

##############################################################################
#                                    XDG                                     #
##############################################################################

set -Ux XDG_DATA_HOME       $HOME/.local/share/
set -Ux XDG_CONFIG_HOME     $HOME/.config/
set -Ux XDG_STATE_HOME      $HOME/.local/state/
set -Ux XDG_CACHE_HOME      $HOME/.cache/

set -Ux POETRY_HOME         "$XDG_DATA_HOME"/poetry/
set -Ux HISTFILE            "$XDG_STATE_HOME"/bash/history/
set -Ux XCURSOR_PATH        /usr/share/icons:$XDG_DATA_HOME/icons
set -Ux GTK2_RC_FILES       "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -Ux GNUPGHOME           "$XDG_DATA_HOME"/gnupg
set -Ux DOOMDIR             "$XDG_CONFIG_HOME"/doom
set -Ux RUSTUP_HOME         "$XDG_DATA_HOME"/rustup

##############################################################################
#                              PLUGINS SETTINGS                              #
##############################################################################

set -U __done_min_cmd_duration 5000 #ms

##############################################################################
#                                   ALIASES                                  #
##############################################################################

alias v="nvim"
alias e="emacsclient -ca emacs"
alias lg="lazygit"
alias ll="exa -lha --git"
alias wget="wget --hsts-file='$XDG_DATA_HOME/wget-hsts'"
