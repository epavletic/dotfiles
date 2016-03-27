# Dotfiles
First, I’d like to point out that _I have no idea what I’m doing_™, but after two reinstalls using this stuff most if actually work like a charm.

This repo came about when I realized that I dreaded doing full reinstalls of my Mac because of the sheer amount of initial config required to get it up to speed. It is my attempt at keeping as much configuration/setup as possible versioned and available when I need it, hopefully making clean reinstalls a breeze 👌. It will:

* Tweak Bash (with a new theme, new font ([Fira Code](https://github.com/tonsky/FiraCode)), some aliases etc.).
* Setup Homebrew and install a number of [formulaes and casks](https://github.com/epavletic/dotfiles/blob/master/Brewfile).
* Setup [NVM](https://github.com/creationix/nvm) and with it, download Node & NPM.
* Install a bunch of global NPM packages.
* Setup OSX with a [bunch of nice defaults](https://github.com/epavletic/dotfiles/blob/master/_bootstrap/setup-osx.sh).

This is basically what you’ll be looking at when done:
![Screenshot of two Terminal.app-windows – one before and one after tweaks.](screenshot.png)

Most of it is obviously tailored to my needs/preferences, but feel free to poke around. I’ve also written a [post mortem](https://gist.github.com/epavletic/eb6d9e0aaf0b6c729735) with some notes from using the dotfiles. Mostly for me, but maybe you’ll find something interresting in there as well.

## Great story man, so how does this work?

1. First, make sure you’ve installed Xcode and the Xcode Command Line Tools: Just download Xcode from the Mac App Store and then run `$ xcode-select --install` in the terminal. After you´ve done this you propably need to launch Xcode once to accept the terms of the Xcode software license agreement.
2. Make sure you’re in your Home-directory (just type `cd` silly), and run `git clone git@github.com:epavletic/dotfiles.git .dotfiles`.

## ToDo’s
- [ ] Support for setting up Sublime Text with settings, key bindings, theme and packages.

## Shoutouts
- [Dan Eden](https://daneden.me/) whos sweet [dotfiles-repo](https://github.com/daneden/dotfiles) inspired me to get my shit together and create my own.
- [Mathias Bynens](https://mathiasbynens.be) and his awesome list of [OSX Defaults](https://mths.be/osx).
