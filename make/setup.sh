#!/bin/bash

#==============================
#
# This setup script will backup present .dotfiles in 
# the $HOME directory and setup Bash, Homebrew, Node etc.
#
#==============================


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
  printf "$green\xE2\x9c\x94 Done! ${end}\n\n"
}

#==============================
#
# Introduction
#
#==============================

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

#==============================
#
# Backup old files and install font
#
#==============================




msg 'Installing Homebrew…'
don
msg 'Installing NVM…'
msg 'Fetching latest stable build of Node/NPM…'
don
err 'It seems that theres been an error'