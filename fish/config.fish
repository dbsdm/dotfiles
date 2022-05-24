if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
set EDITOR "nvim"    
set VISUAL "nvim" 
set -x VIRTUAL_ENV_DISABLE_PROMPT 0
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH
# plugin confs
set --universal pure_enable_git true
set -U __done_min_cmd_duration 5000 #ms

alias fish_aliases="nvim ~/.config/fish/config.fish"
alias ll="exa -lha --git --group-directories-first"
alias lg="lazygit"
alias v="nvim"
