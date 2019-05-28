hashes='\033[0;32m'
words='\033[0;36m'
yellow='\033[1;33m'
NC='\033[0m'
blackText='\e[1;30m'
whitebg='\e[47m'

alias vim='nvim'
alias bim='nvim'
alias ssh="ssh -A" # forward ssh keys to server
alias cp='cp -iv' # prompt when overwriting and verbose
alias mv='mv -iv' # prompt when overwriting and verbose
alias ll='ls -FGlAhp'
alias du1='du -h -d 1'
alias ls='exa'
# channeling Justin & alisiasing my git
alias gs='git status'
alias gap='git add -p'
#alias gc='g commit'
#alias gcm='g commit -m'
alias please='sudo !!'

# networking
alias myip='curl ip.appspot.com' # show public IP

# drush cc all is too long
alias dc='drush cc all'

#resource my profile
alias sourceme='source ~/.profile'

# I keep typing the R so why not
alias docker-composer='docker-compose'
alias docker-start='systemctl start docker'
alias docker-stop='systemctl stop docker'

vpn-start() {
  sudo systemctl start openvpn-client@$1
}

vpn-stop() {
  sudo systemctl stop openvpn-client@$1
}

vpn-status() {
  sudo systemctl status openvpn-client@$1
}

alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

# show my calendar
alias mycal='gcalcli agenda --calendar josh@codekoalas.com --calendar joshfabean@gmail.com'

alias terminus=/home/joshfabean/Code/vendor/bin/terminus

# docker commands
ddrupal() {
  docker exec $1 /usr/local/bin/drupal --root=/var/www/site/docroot ${*:2}
}

ddrush() {
  docker exec $1 /usr/local/src/drush/drush --root=/var/www/site/docroot ${*:2}
}

dlogin() {
  docker exec -ti $1 /bin/bash
}

pass() {
  lpass show -c --password $(lpass ls  | fzf | awk '{print $(NF)}' | sed 's/\]//g')
}

cheat() {
  curl cht.sh/$1
}

#todo.sh
alias todo='todo.sh'
alias t='todo.sh'

# launch PICO-8 with logs
alias pico8='/Applications/PICO-8.app/Contents/MacOS/pico8'

alias dmenu="dmenu -b -fn '-*-helvetica-medium-r-normal-*-17-*-*-*-*-*-*-*' -nf '#e04613' -nb '#3b3b3b' -sf '#e04613' -sb '#000000'"

# my path
export PATH="/usr/local/bin/php:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

npm set prfix ~/.npm
PATH="$HOME/.npm/bin:$PATH"
PATH="./node_modules/.bin:$PATH"

#export ANDROID_HOME="/usr/local/opt/android-sdk"
export ANDROID_HOME="/home/joshfabean/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/Code/pantheon-tools
export PATH=$PATH:$HOME/Code/vendor/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export LIBVA_DRIVER_NAME=vdpau
export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export LC_ALL="en_US.UTF-8"

