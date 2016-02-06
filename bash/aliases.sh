# Applications
alias sub='open -a "/Applications/Sublime Text.app"'


# Bash
alias dotfiles='sub ~/.dotfiles'
alias reload='source ~/.bash_profile; echo ".bash_profile reloaded"'
alias colors='( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )'
alias ls='ls -lahFL --group-directories-first --color'


# Git
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git difftool'


# Drush
alias cc='drush cc all'