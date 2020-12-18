#!/bin/bash

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#
# This script will:
# - Install the latest LTS build of Node & npm.
# - Install the specified npm packages.
#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#
# Npm Packages
# List of npm packages that will be installed globally.
# Unsure if a package should be globally installed?
# Ony way of reasoning is this:
#
# - If you’re installing something that you want to use in
#   your application, using ”import Xxx from 'xxx'”, then 
#   install it locally, at the root of your project.
#
# - If you’re installing something that you want to use in
#   your shell, on the command line or something, install
#   it globally, so that its binaries end up in your $PATH
#   environment variable.
#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
globalpackages=(
  "caniuse-cmd" # https://github.com/sgentle/caniuse-cmd
  "david" # https://github.com/alanshaw/david
  "fkill-cli" # https://github.com/sindresorhus/fkill-cli
  "gulp-cli"
  "kill-tabs" # https://github.com/sindresorhus/kill-tabs
  "parker" # https://github.com/katiefenn/parker
  "tldr" # https://tldr.sh/
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
  # Create global node_modules directory
  mkdir -p ${HOME}/.npm-packages

  msg 'Installing Node/npm via n…'
  n lts

  # Set npm prefix to global node_modules directory
  npm config set prefix ${HOME}/.npm-packages

  source ~/.zshrc

  don
  msg 'Installing npm packages'

  for package in ${globalpackages[*]}
  do
    printf "${grey}Installing ${package}…${end}\n"
    npm install ${package} -g
    printf "$green\xE2\x9c\x94 ${package} is installed. ${end}\n\n"
  done
fi

printf "\n\n$green\xE2\x9c\x94 Node/npm should be ready for use on your system! Probably best to open a new Terminal-window for it to pick upp all tweaks.${end}\n\n"
