#!/bin/bash

#==========================================================
#
#  This mother of all bootstrap-scripts will:
#  - Backup present .dotfiles in the $HOME directory.
#  - Setup symlinks to the new .dotfiles.
#  - Import the Wombat.terminal-theme and set it as
#    default.
#  - Setup Homebrew for OSX, and install a number of
#    formulaes and casks (/apps).
#  - Install NVM (Node Version Manager).
#  - With the help of NVM, install the latest build of
#    Node & NPM.
#  - Install the NPM packages listed in the package.json.
#  - Setup OSX with a bunch of nice defaults.
#  - Setup Visual Studio Code with settings, keybindings
#    and extensions. 
#
#  Note that the actions described above are to some extent
#  possible to execute on their own, without touching the
#  others. Check out each setup-*.sh-file for more info.
#
#==========================================================

# First, Lets setup some output functions for easy access.
txt=$(tput setaf 153)
green=$(tput setaf 052)
grey=$(tput setaf 235)
red=$(tput setaf 160)
lightBlue=$(tput setaf 75)
yellow=$(tput setaf 227)
end=$(tput sgr0)

msg() {
  printf "${grey}$*${end}\n"
}

err() {
  printf "${red}\xe2\x9c\x97 $* ${end}\n"
}

don() {
  printf "$green\xE2\x9c\x94 $* ${end}\n\n"
}

printf "\n\n${green} _____     ______     ______   ______   __     __         ______     ______
/\\  __-.  /\\  __ \\   /\\__  _\\ /\\  ___\\ /\\ \\   /\\ \\       /\\  ___\\   /\\  ___\\
\\ \\ \\/\\ \\ \\ \\ \\/\\ \\  \\/_/\\ \\/ \\ \\  __\\ \\ \\ \\  \\ \\ \\____  \\ \\  __\\   \\ \\___  \\
 \\ \\____-  \\ \\_____\\    \\ \\_\\  \\ \\_\\    \\ \\_\\  \\ \\_____\\  \\ \\_____\\  \\/\\_____\\
  \\/____/   \\/_____/     \\/_/   \\/_/     \\/_/   \\/_____/   \\/_____/   \\/_____/${end}

              ${lightBlue}Setting up your computer like a boss since 2016${end}\n\n\n"

printf "${txt}This script is gonna do a bunch of wacky things to your computer/CLI.\nContinue? [Y/n]: ${end}"
read a
if [[ $a == "N" || $a == "n" ]]; then
  printf "\n${red}FORMATTING DISK...${end}\n"
  sleep 1
  printf "${grey}Just kidding. => Didn't touch a thing.${end}\n\n"
  exit;
else
  printf "\n👌  ${txt}Awesomesauce! Let's do this…${end}\n\n"
  sleep 1
fi

# Setup Bash and Terminal.app
./setup-bash.sh

# Setup Homebrew
./setup-homebrew.sh

# Setup NVM, Node & NPM
./setup-node.sh

# Setup OSX
./setup-osx.sh

# Setup Visual Studio Code
./setup-vscode.sh

don "I think we're done! Give her a spin, why dont'cha?"
