#!/bin/bash

# update drupal console
/usr/local/bin/drupal self-update;

# update nvm
/usr/bin/curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash;w;

# update brew things
/usr/local/bin/brew update && brew install `brew outdated`;

