#!/bin/bash

#==========================================================
#
# This script will:
# - Install NVM (Node Version Manager).
# - With the help of NVM, install the latest build of Node
#   & NPM.
# - Install the NPM packages listed in the package.json.
#
#==========================================================

# First, some output functions & variables for easy access.
grey=$(tput setaf 235)
green=$(tput setaf 052)
code=$(tput setab 236; tput setaf 253)
end=$(tput sgr0)

msg() {
  printf "${grey}$*${end}\n"
}

don() {
  printf "$green\xE2\x9c\x94 Done! ${end}\n\n"
}

dir=$HOME/.dotfiles # dotfiles directory

# Make sure we're in the .dotfiles directory
cd $dir


if [[ `uname` == "Darwin" ]]; then
  msg 'Installing NVM…'
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
  source ~/.bash_profile
  don
  msg 'Fetching latest stable build of Node/NPM…'
  nvm install node
  don
  msg  'Installing Node packages'
  npm install -g
  don
fi

printf "$green\xE2\x9c\x94 NVM is up and running and Node/NPM is ready for you!${end}\n\n"