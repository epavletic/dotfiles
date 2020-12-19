
# CoreUtils - switch from BSD to Linux/GNU command line tools.
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# N (https://github.com/tj/n)
export N_PREFIX="${HOME}/.n"
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="${N_PREFIX}/bin:${NPM_PACKAGES}/bin:${PATH}"
