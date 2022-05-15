if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
set EDITOR "nvim"    
set VISUAL "nvim" 
set -x VIRTUAL_ENV_DISABLE_PROMPT 0
set -gx QT_QPA_PLATFORMTHEME qt5ct

alias fish_aliases="nvim ~/.config/fish/config.fish"
alias ll="exa -lha --git"
alias v="nvim"
