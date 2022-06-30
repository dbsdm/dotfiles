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
set -gx PATH "$HOME/.cargo/bin/" $PATH
set -gx PATH "$HOME/.local/bin/" $PATH

##############################################################################
#                                    XDG                                     #
##############################################################################

set -Ux XDG_DATA_HOME       $HOME/.local/share/
set -Ux XDG_CONFIG_HOME     $HOME/.config/
set -Ux XDG_STATE_HOME      $HOME/.local/state/
set -Ux XDG_CACHE_HOME      $HOME/.cache/

set -Ux POETRY_HOME         "$XDG_DATA_HOME"/poetry/
set -Ux HISTFILE            "$XDG_STATE_HOME"/bash/history/

##############################################################################
#                              PLUGINS SETTINGS                              #
##############################################################################

set -U __done_min_cmd_duration 5000 #ms

##############################################################################
#                                   ALIASES                                  #
##############################################################################

alias v="nvim"
alias lg="lazygit"
alias ll="exa -lha --git"
