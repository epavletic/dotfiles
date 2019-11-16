#!/bin/bash

#==========================================================
#
# NOTE! Make sure to have installed VSCode and enabled the
# 'code' shell command before running this script.
#
# This script will setup Visual Studio Code for MacOS.
# It will:
# - symlink the settings.json and keybindings.json to its
#   proper place (~/Library/Application Support/Code/…).
# - Install the defined extensions.
#
#==========================================================

# Extensions to be installed.
# Required format is <publisher>.<extension>.
extensions=(
  "JerryHong.autofilename"
  "Tyriar.sort-lines"
  "christian-kohler.npm-intellisense"
  "christian-kohler.path-intellisense"
  "EditorConfig.editorconfig"
  "dbaeumer.vscode-eslint"
  "donjayamanne.githistory"
  "esbenp.prettier-vscode"
  "vscode-icons-team.vscode-icons"
  "shinnn.stylelint"
  "xabikos.JavaScriptSnippets"
  "naumovs.theme-oceanicnext"
  "jpoissonnier.vscode-styled-components"
)

green=$(tput setaf 052)
grey=$(tput setaf 247)
red=$(tput setaf 167)
settings=$HOME/.dotfiles/vs_code # dotfiles directory
appSettingsPath=$HOME/Library/Application\ Support/Code/User

positive() {
  printf " ${green}\xE2\x9c\x94\n"
}

negative() {
  printf " ${red}\xe2\x9c\x98 $*${end}\n"
}

neutral() {
  printf "${grey}$*${end}"
}

# Check if the VS Code 'code' shell command is available,
# which should indicate that VS Code is installed.
vsCodeIsInstalled() {
  hash 'code' &>/dev/null &&
    return 0 ||
    return 1
}

# Remove current settings so that the symlinking does not fail.
removeIfExists() {
  if [ -e "$1" ]
  then 
    rm -- "$1"
  fi
}

createSymlinks() {
  removeIfExists "${appSettingsPath}/settings.json"
  neutral 'Creating symlink for settings…'
  ln -s "${settings}/settings.json" "${appSettingsPath}/settings.json" && positive || (negative && exit)
  removeIfExists "${appSettingsPath}/keybindings.json"
  neutral 'Creating symlink for keybindings…'
  ln -s "${settings}/keybindings.json" "${appSettingsPath}/keybindings.json" && positive || (negative && exit)
}

installExtensions() {
  neutral '\nInstalling Code extensions…'
  for extension in ${extensions[*]}
  do
    neutral "\nInstalling ${extension}…\n"
    code --install-extension ${extension}
  done
}

# Script body
#==========================================================
neutral '\nChecking if Visual Studio Code is available…'
if vsCodeIsInstalled; then
  positive
  createSymlinks
  installExtensions
else
  negative
  printf "\n${red}Visual Studio Code is not installed, or the 'code' shell command is not available. Aborting…${end}\n"
  exit
fi

printf "\n\n$green\xE2\x9c\x94 Visual Studio Code should be prepped with extensions, settings and keyboard bindings. Start the app and give it a spin!${end}\n\n"
