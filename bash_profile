for file in $HOME/.dotfiles/bash/*.sh
do
  source $file
done

# Colors for ls
eval "$(dircolors -b ~/.dir_colors)"
