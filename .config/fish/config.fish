alias vim='nvim'
alias bim='nvim'
alias ssh="ssh -A" # forward ssh keys to server
alias cp='cp -iv' # prompt when overwriting and verbose
alias mv='mv -iv' # prompt when overwriting and verbose
alias ll='ls -FGlAhp'
alias du1='du -h -d 1'
alias ls='exa'
alias gs='git status'
alias gap='git add -p'
alias git_current_branch="git branch | grep \* | cut -d ' ' -f2"
alias ggpull='git pull origin (git_current_branch)'
alias ggpush='git push origin (git_current_branch)'

alias docker-composer='docker-compose'
alias docker-start='systemctl start docker'
alias docker-stop='systemctl stop docker'

function vpn-start
  sudo systemctl start openvpn-client@$1
end

function vpn-stop
  sudo systemctl stop openvpn-client@$1
end

function vpn-status
  sudo systemctl status openvpn-client@$1
end

# my path
export PATH="/usr/local/bin/php:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

npm set prfix ~/.npm
export PATH="$HOME/.npm/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

export LIBVA_DRIVER_NAME=vdpau
export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export LC_ALL="en_US.UTF-8"

function fish_prompt
  powerline-rs --shell bare $status
end
