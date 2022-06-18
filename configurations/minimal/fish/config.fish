fish_vi_key_bindings
set EDITOR "nvim"    
set VISUAL "nvim" 
set -x VIRTUAL_ENV_DISABLE_PROMPT 0
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH
set -U pure_enable_git true
set -U __done_min_cmd_duration 5000 #ms

alias fish_aliases="nvim ~/.config/fish/config.fish"
alias ll="exa -lha --git --group-directories-first"
alias lg="lazygit"
alias v="nvim"
