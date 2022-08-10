
# Path to `oh-my-zsh` installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="wombat"
ZSH_DISABLE_COMPFIX=true

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [ -f ~/.work.sh ]; then
. ~/.work.sh
fi
