if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set -gx EDITOR nvim

alias ggpull='git pull origin (git rev-parse --abbrev-ref HEAD)'
alias ggpush='git push origin (git rev-parse --abbrev-ref HEAD)'
alias gs='git status'
alias vim='nvim'
alias vi='nvim'
alias ls='eza --icons'
alias laptop-display-off="hyprctl keyword monitor 'eDP-1, disable'"
alias laptop-display-on="hyprctl keyword monitor 'eDP-1, highres, 3441x1441,1'"

starship init fish | source
zoxide init --cmd cd fish | source
