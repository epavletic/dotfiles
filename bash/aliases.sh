# Applications
alias sub='open -a "/Applications/Sublime Text.app"'


# Bash
alias dotfiles='sub ~/.dotfiles'
alias reload='source ~/.bash_profile; echo ".bash_profile reloaded"'
alias colors='( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )'
alias ls='ls -lahFL --group-directories-first --color'
alias brb="osascript -e 'set alertResult to display notification \"... come back to Modor we take you!\" with title \"AHDZIT\"'"


# Git
alias gh="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git difftool'


# Drush
alias cc='drush cc all; brb'
alias cr='drush cr all; brb'
alias init='drush vset preprocess_css 0; drush vset preprocess_js 0; drush upwd kodamera --password="adflarn600g"; echo "password was set to \"adflarn600g\""'
alias reset-password='drush upwd kodamera --password="adflarn600g"'
