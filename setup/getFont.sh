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

don