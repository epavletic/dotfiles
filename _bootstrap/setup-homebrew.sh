#!/bin/zsh

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#
# This script will setup Homebrew for MacOS, and install a
# number of formulaes and casks (/apps), all specified in
# the Brewfile in the .dotfiles root.
#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

# First, some output functions & variables for easy access.
green=$(tput setaf 035)
end=$(tput sgr0)

msg() {
  printf "\n${green}$*${end}\n"
}

fin() {
  printf "\n$green\xE2\x9c\x94 $*${end}\n\n"
}

# Make shure we're in the dotfiles-directory.
cd $HOME/.dotfiles

if [[ `uname` == "Darwin" ]]; then
  msg "Installing Homebrew and the formulae/casks specified in the Brewfile…"
  msg "Note that Homebrew may ask for your password during the install, so don't stray too far away."

  which -s brew
  if [[ $? != 0 ]] ; then
    # Install Homebrew.
    # https://brew.sh/
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    msg "Homebrew appears to be already installed.\nUpdating packages list…"
    brew update
  fi

  printf "${green}\n\n
  ╔════════════════════════════════════════════════════╗
  ║  Make sure you are logged into the Mac App Store!  ║
  ║           Press any key to continue 🙏             ║
  ╚════════════════════════════════════════════════════╝\n\n${end}"
  read -k1 -s

  # Fetch the Brew bundle command, and excecute it.
  brew tap homebrew/bundle
  brew bundle
fi

fin "Homebrew is hopefully up and running, along with a bunch of other applications!"
