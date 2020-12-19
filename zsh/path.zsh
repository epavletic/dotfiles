#░░░░░░░░░ PATH’s ░░░░░░░░░

# CoreUtils - switch from BSD to Linux/GNU command line tools.
CORE_UTILS="/usr/local/opt/coreutils/libexec/gnubin"

# N (https://github.com/tj/n)
export N_PREFIX="${HOME}/.n"
export NPM_PACKAGES="${HOME}/.npm-packages"

path=(
	$CORE_UTILS
	${NPM_PACKAGES}/bin
	${N_PREFIX}/bin
	$path
)

# Colors for ls
eval "$(dircolors -b ~/.dir_colors)"
