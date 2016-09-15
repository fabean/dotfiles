#!/bin/bash

# update drupal console
echo 'updating Drupal console';
/usr/local/bin/drupal self-update;

# update nvm
echo 'updating nvm';
/usr/bin/curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash;w;

# update brew things
echo 'updating brew things';
/usr/local/bin/brew update && brew install `brew outdated`;

# update pip & all pip things
echo 'update pip & things';
/usr/local/bin/pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
