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

# Some variables
dir=$HOME/.dotfiles                  # dotfiles directory
now=`date +%Y-%m-%d-%H:%M:%S`
olddir=$HOME/.dotfiles_old/$now      # old dotfiles backup directory
files=("gitconfig" "gitignore_global" "osx") # list of files/folders to symlink in homedir
nodot=("Brewfile") # list of non-dot files to symlink

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
# Backup old files
#
#==============================

# create dotfiles_old in homedir
msg "Creating $olddir for backup of any existing dotfiles in $HOME..."
mkdir -p $olddir
don

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
msg "Moving existing dotfiles from $HOME to $olddir..."
for file in $files; do
  mv $HOME/.$file $olddir
  ln -s $dir/$file $HOME/.$file
done

for file in $nodot; do
  mv $HOME/$file $olddir
  ln -s $dir/$file $HOME/$file
  chflags -h hidden $HOME/$file
done

don

if [[ `uname` == "Darwin" ]]; then
  msg "Installing Homebrew packages..."
  type brew &>/dev/null && printf "`brew bundle`" || echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\" && brew tap Homebrew/bundle && brew bundle`"
  brew update && brew upgrade `brew outdated`
  don

  msg 'Installing NVM…'
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
  don
  msg 'Fetching latest stable build of Node/NPM…'
  nvm install node
  don
  msg  'Installing Node packages'
  npm install -g
  don
fi

if [[ `uname` == "Darwin" ]]; then
  # Set some better OS X defaults
  $HOME/.osx
fi

printf "$green\xE2\x9c\x94 I think we're done! Give her a spin, why dont'cha? ${end}\n\n"