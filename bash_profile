for file in $HOME/.dotfiles/bash/*.sh
do
  source $file
done

eval "$(dircolors -b ~/.dir_colors)"
# eval 'dircolors ~/.dotfiles/.dir_colors'
