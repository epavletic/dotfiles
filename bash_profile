for file in $HOME/.dotfiles/bash/*.sh
do
  source $file
done

# CoreUtils colors - run 'brew install coreutils' for these to work
eval "$(dircolors -b ~/.dir_colors)"
# eval 'dircolors ~/.dotfiles/.dir_colors'
