#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

function create_symlinks () {
  CURRENT_DIR="$(pwd "${BASH_SOURCE}")"

  for file in $(find . | sed '/^\.$/d' | sed 's/^\.\///g' | grep -v '.gitignore\|bootstrap.sh\|LICENSE.txt\|README.md\|^\.$\|^.git\/[\-\.\/a-zA-Z0-9]\|(^\.$)\|^.git$'); do
    ln -snf $CURRENT_DIR/${file##*/} ~/${file##*/}
  done

  source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  create_symlinks
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    create_symlinks
  fi
fi

unset create_symlinks

#####

# Credits:
# https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh
