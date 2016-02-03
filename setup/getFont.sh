#!/bin/bash

#======================================
#
# This script will fetch Fira Code and install it 
# for the current user.
#
#======================================

#======================================
# Variables and helper functions
#======================================

grey=$(tput setaf 235)
green=$(tput setaf 052)
code=$(tput setab 236; tput setaf 253)
end=$(tput sgr0)
tmpdir=$HOME/.tmp_font
fontdir=$HOME/Library/Fonts

msg() {
  printf "${grey}$*${end}\n"
}

don() {
  printf "$green\xE2\x9c\x94 Done! ${end}\n\n"
}

#======================================
# Let's do this
#======================================

msg 'Fetching Fira Code from Github…'
git clone https://github.com/tonsky/FiraCode.git ${tmpdir}

msg "Moving Fira Code font-files to ${code}${fontdir}${end}${grey}…"
find ./.tmp_font -name 'FiraCode-*.otf' -exec mv -i {} ${fontdir}} \;
don

msg "Cleaning up…"
rm -rf ${tmpdir}

# open -a Terminal Wombat.terminal
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