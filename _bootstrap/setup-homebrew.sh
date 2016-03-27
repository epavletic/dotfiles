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
  printf "\n${grey}$*${end}\n"
}

fin() {
  printf "\n$green\xE2\x9c\x94 $*${end}\n\n"
}

# Make shure we're in the home-directory.
cd $HOME

if [[ `uname` == "Darwin" ]]; then
  msg "Installing Homebrew and the formulae/casks specified in the Brewfile…"
  msg "Note that Homebrew may ask for your password during the install, so don't stray too far away."

  which -s brew
  if [[ $? != 0 ]] ; then
    # Install Homebrew.
    # https://github.com/Homebrew/homebrew/tree/master/share/doc/homebrew#readme
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    msg "Homebrew appears to be already installed.\nUpdating packages list…"
    brew update
  fi

  # Fetch the Brew bundle command, and excecute it.
  brew tap homebrew/bundle
  brew bundle

  # Add CoreUtils to $PATH
  echo '
# CoreUtils - switch from BSD to Linux/GNU command line tools.
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.dotfiles/bash/path.sh

  don
fi

fin "Homebrew is up and running.\nYou should open a new Terminal-window in order for the CoreUtils settings to take effect."
