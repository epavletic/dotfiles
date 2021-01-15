#!/bin/zsh

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#
# This script will:
# - Backup present .dotfiles in the $HOME directory.
# - Setup symlinks to the new .dotfiles.
# - Install Oh My Zsh and configure it.
# - Import the Wombat.terminal-theme and set it as default.
#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

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

now=`date +%Y-%m-%d-%H:%M:%S`
dir=$HOME/.dotfiles # dotfiles directory
olddir=$HOME/.dotfiles_old/$now # old dotfiles backup directory
files=("dir_colors" "gitconfig" "gitignore_global" "vimrc" "vim") # list of files/folders to symlink
nodot=("Brewfile") # list of non-dot files to symlink


# Install the Wombal.terminal theme and set as default.
msg "Setting up Terminal.app"
osascript <<EOD
tell application "Terminal"
  local allOpenedWindows
  local initialOpenedWindows
  local windowID
  set themeName to "Wombat"
  (* Store the IDs of all the open terminal windows. *)
  set initialOpenedWindows to id of every window
  (* Open the custom theme so that it gets added to the list
     of available terminal themes (note: this will open two
     additional terminal windows). *)
  do shell script "open '$HOME/.dotfiles/" & themeName & ".terminal'"
  (* Wait a little bit to ensure that the custom theme is added. *)
  delay 1
  (* Set the custom theme as the default terminal theme. *)
  set default settings to settings set themeName
  set font name of default settings to "Fira Code"
  set font size of default settings to 16
  (* Get the IDs of all the currently opened terminal windows. *)
  set allOpenedWindows to id of every window
  repeat with windowID in allOpenedWindows
    (* Close the additional windows that were opened in order
       to add the custom theme to the list of terminal themes. *)
    if initialOpenedWindows does not contain windowID then
      close (every window whose id is windowID)
    (* Change the theme for the initial opened terminal windows
       to remove the need to close them in order for the custom
       theme to be applied. *)
    else
      set current settings of tabs of (every window whose id is windowID) to settings set themeName
    end if
  end repeat
end tell
EOD
don

# create dotfiles_old in homedir
msg "Creating $olddir for backup of any existing dotfiles in $HOME..."
mkdir -p "$olddir"
don

# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

source ~/.zshrc

# change to the dotfiles directory
cd "$dir"

ohMyZshDir=$HOME/.oh-my-zsh

# Check if Oh My Zsh has been installed
if [ -d ${ohMyZshDir} ]; then
  # Symlink the Wombat zsh theme.
  ln -s ${dir}/zsh/wombat.zsh-theme ${ohMyZshDir}/custom/themes/wombat.zsh-theme
  # Symlink some other settings for OhMyZsh.
  ln -s ${dir}/zsh/aliases.sh ${ohMyZshDir}/custom/aliases.sh
  ln -s ${dir}/zsh/path.zsh ${ohMyZshDir}/custom/path.zsh
  ln -s ${dir}/zsh/exports.zsh ${ohMyZshDir}/custom/exports.zsh
else
  echo "Oh My Shell does not seem to be installed, that part of the setup is ignored…"
fi

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
msg "Moving existing dotfiles from $HOME to $olddir and adding symlinks..."
for file in ${files[*]}
do
  [ -f $HOME/.${file} ] && mv $HOME/.${file} ${olddir}
  ln -s ${dir}/${file} $HOME/.${file}
done

for file in ${nodot[*]}
do
  [ -f $HOME/.${file} ] && mv $HOME/${file} ${olddir}
  ln -s ${dir}/${file} $HOME/${file}
  chflags -h hidden $HOME/${file}
done

# Suppress ”Last login” message when opening a new terminal window/tab.
touch $HOME/.hushlogin

source $HOME/.zshrc
# Lägg till kommentar om att peta in rätt grejer i .zsh i ~
printf "$green\xE2\x9c\x94 Zsh and Terminal.app is all prepped and ready! You should open a new Terminal-window for Terminal.app to pick upp all tweaks.${end}\n\n"
