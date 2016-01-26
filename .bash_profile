for file in $HOME/.dotfiles/*.sh
do
  source $file
done

# Notes
# brew install coreutils - to switch from BSD to Linux/GNU command line 
# tools. Also add the path to the utils to your $PATH as seen above.

eval "$(dircolors -b ~/.dir_colors)"
# eval 'dircolors ~/.dotfiles/.dir_colors'
