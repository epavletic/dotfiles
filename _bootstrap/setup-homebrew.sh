#!/bin/bash

#==========================================================
#
# This script will setup Homebrew for OSX, and install a
# number of formulaes and casks (/apps), all specified in 
# the Brewfile in the .dotfiles root.
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

if [[ `uname` == "Darwin" ]]; then
  msg "Installing Homebrew and the formulae/casks specified in the Brewfile..."
  type brew &>/dev/null && printf "`brew bundle`" || echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\" && brew tap Homebrew/bundle && brew bundle`"
  brew update && brew upgrade `brew outdated`
  don
fi