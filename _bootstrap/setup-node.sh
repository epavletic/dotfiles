#!/bin/bash

#==========================================================
#
# This script will:
# - Install NVM (Node Version Manager).
# - With the help of NVM, install the latest build of Node
#   & NPM.
# - Install the specified NPM packages.
#
#==========================================================

#==========================================================
#
# NPM Packages
# List of NPM packages that will be installed globally.
# Unsure if a package should be globally installed?
# Ony way of reasoning is this:
#
# - If you’re installing something that you want to use in
#   your program, using ”import Xxx from 'xxx'”, then install
#   it locally, at the root of your project.
#
# - If you’re installing something that you want to use in
#   your shell, on the command line or something, install
#   it globally, so that its binaries end up in your $PATH
#   environment variable.
#
#==========================================================
globalpackages=(
  "babel-cli"
  "caniuse-cmd"
  "grunt-cli"
  "gulp-cli"
  "parker"
  "tldr"
  "webpack"
  "webpack-dev-server"
  "yo"
)


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

  # Set the default Node version to be used in any new shell
  nvm alias default node

  don
  msg 'Installing NPM packages'

  for package in ${globalpackages[*]}
  do
    printf "${grey}Installing ${package}…${end}\n"
    npm install ${package} -g
    printf "$green\xE2\x9c\x94 ${package} is installed. ${end}\n\n"
  done
fi

printf "\n\n$green\xE2\x9c\x94 NVM is up and running and Node/NPM is ready for you! You should open a new Terminal-window for Terminal.app to pick upp all tweaks.${end}\n\n"
