#------ PROMPT STYLE ------------------------------------
boldGreen=$(tput setaf 052;tput bold)
grey=$(tput setaf 235)
lightBlue=$(tput setaf 75)
end=$(tput sgr0)

# \n – New line
# \d – Current date
# \t - The time, in 24-hour HH:MM:SS format. 
# \T - The time, in 12-hour HH:MM:SS format. 
# \@ - The time, in 12-hour am/pm format.
# \h – Host name
# \# – Command number
# \u – User name
# \W – Current working directory (ie: Desktop/)
# \w – Current working directory with full path (ie: /Users/Admin/Desktop/)
# \[ - Begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
# \] - End a sequence of non-printing characters


export PS1="\n${boldGreen}\w${end}${grey}\$(__git_ps1)\n\[${lightBlue}\]❯ \[${end}\]"
# export PS1="\n$(tput setaf 051;tput bold)\w$(tput sgr0)$(tput setaf 248)\$(__git_ps1)\n\[$(tput setaf 111)\]❯ \[$(tput sgr0)\]"