hashes='\033[0;32m'
words='\033[0;36m'
yellow='\033[1;33m'
NC='\033[0m'
blackText='\e[1;30m'
whitebg='\e[47m'

echo -e "${hashes}███████████████████████████████████████████████████████████████████████████████████████████████████████████████████${NC}"

# run NVIM instead of VIM
alias vim='nvim'
# rerun last command with sudo in front (I dont think this works)
alias please='eval "sudo $(fc -ln -1)"'

# open current directory in Atom
alias atom='open -a Atom ./'

# gen settings
alias ssh="ssh -A" # forward ssh keys to server
alias cp='cp -iv' # prompt when overwriting and verbose
alias mv='mv -iv' # prompt when overwriting and verbose
alias ll='ls -FGlAhp'
alias du1='du -h -d 1'

# networking
alias myip='curl ip.appspot.com' # show public IP

# build out Android firmware for OmniBox
alias buildfirmware='
  cd ~/Code_Koalas/omni/firmware/update; zip -r update_new *;
  mv update_new.zip ../;
  cd ..;
  echo -e "${words}compressing your firmware...${NC}";
  java -Xmx2024m -jar signapk.jar -w testkey.x509.pem testkey.pk8 update_new.zip update.zip;
  echo -e "${yellow}=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-${NC}";
  echo -e "${yellow}|/\|       Enjoy your new firmware ^_^      |/\|${NC}";
  echo -e "${yellow}|\/|  \e[0;90m More query, no hesitate mush to ask  ${yellow}|\/|${NC}";
  echo -e "${yellow}=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-${NC}"'

# compile out and sign the OmniBox app
alias buildapp="
  echo -e '${hashes}One fresh app coming up!${NC}'
  cd ~/Sites/omnibox;
  phonegap build android;
  cd platforms/android;
  ant release;
  echo -e '${hashes}Enjoy your new app hot off the compiler!${NC}'
  open /Users/joshfabean/Sites/omnibox/platforms/android/bin/;
  echo -e '\033[34;5m███████████████████████████████████████████████████████████████████████████████████████████████████████████████████\033[0'
  echo -e '\033[35;5m███████████████████████████████████████████████████████████████████████████████████████████████████████████████████\033[0${NC}'
  echo -e '\033[45;5m               IF THIS IS FOR PRODUCTION SWITCH TO PRODUCTION AND TAG THIS OR ELSE!!!!!!\033[0                     ${NC}'
  echo -e '\033[36;5m███████████████████████████████████████████████████████████████████████████████████████████████████████████████████\033[0'
  echo -e '\033[37;5m███████████████████████████████████████████████████████████████████████████████████████████████████████████████████\033[0'"

# build not signed app
alias notsigned="phonegap build android --verbose && phonegap run android --verbose"

# grunt build trial app
alias trialapp='
  echo -e "${yellow}trial app *grunt*${NC}";
  grunt --target=trial;
'

# open Chrome & Chrome Canary in no security mode for testing
alias chrome="open /Applications/Google\ Chrome.app --args --disable-web-security"
alias chromecan="open /Applications/Google\ Chrome\ Canary.app/ --args --disable-web-security"

# adb logcat aliases to show me better things
alias logcat='adb logcat -v long -s "CordovaLog CordovaWebView CordovaActivity"'
alias longcat="adb logcat -v long"

# lock screen when I leave my desk you cannot trust people
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# open mps which is a spotify from terminal thing
alias spotify='mps'

# drush cc all is too long
alias dc='drush cc all'

# drush sql-sync omnibox site
alias gimmeomnibox='drush sql-sync @p-omnibox_tv @local-omniboxtv -y'

#drush sql-dump to file
alias drushdump='drush sql-dump --result-file=starter.sql'

#add drupal golden core to project
alias addgolden='git remote add golden git@gitlab.codekoalas.com:golden/golden-drupal-core.git'
alias addgolen='addgolden'

#resource my profile
alias sourceme='source ~/.profile'

# my path
export PATH="/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/joshfabean/Development/android/sdk/tools:/Users/joshfabean/Development/android/sdk/platform-tools:$PATH"

export NVM_DIR="/Users/joshfabean/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
