if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
command colorscript -e 3

alias fish_aliases="nvim ~/.config/fish/config.fish"
alias ll="exa -lha --git"
alias v="nvim"
