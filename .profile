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
alias loopbackftw='sudo ip addr add 192.168.237.237/24 brd + dev wlp4s0 label wlp4s0:1'
# channeling Justin & alisiasing my git
alias gs='g status'
alias ga='g add'
alias gc='g commit'
alias gcm='g commit -m'
alias please='sudo !!'

# networking
alias myip='curl ip.appspot.com' # show public IP

# drush cc all is too long
alias dc='drush cc all'

#resource my profile
alias sourceme='source ~/.profile'

# I keep typing the R so why not
alias docker-composer='docker-compose'

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

#todo.sh
alias todo='todo.sh'
alias t='todo.sh'

# launch PICO-8 with logs
alias pico8='/Applications/PICO-8.app/Contents/MacOS/pico8'

# my path
export PATH="/usr/local/bin/php:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/joshfabean/Development/android/sdk/tools:/Users/joshfabean/Development/android/sdk/platform-tools:/Users/joshfabean/.composer/vendor/bin:$PATH"

export NVM_DIR="/Users/joshfabean/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME="/usr/local/opt/android-sdk"
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/Code/pantheon-tools
export PATH=$PATH:$HOME/Code/vendor/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
