for file in $HOME/.dotfiles/zsh/*.sh
do
  source $file
done

# Colors for ls
eval "$(dircolors -b ~/.dir_colors)"
