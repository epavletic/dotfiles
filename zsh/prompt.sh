# %~ - Current working directory with $HOME substituted with ”~”.
# %F - Set foreground (text) color.
# %f - Reset foreground color to default.
# %B - Set text to bold.
# %b - Reset text to normal weight.

currentDirectory='%F{036}%B%~%b%f'
promptCharacter='%F{038}❯%f'
gitInfo='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%F{238}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{238}]%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" ⇢ %F{222}✗"

PROMPT="
${currentDirectory} ${gitInfo}
${promptCharacter} "