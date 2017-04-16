#!/bin/bash

# check what qutebrowser is installed
stow -d qutebrowser/ -t $HOME qutebrowser-0.10.1

# check what awesomeWM version is installed
stow -d awesome/ -t $HOME awesome-4.0

stow zsh/

stow config/

stow fonts/

stow gimp/

stow git/

# check if there is ~/.mpd/playlists
# if not create it
stow mpd/ 
# replace $USER in ncmcpp/config with current user

stow redshift/

stow scripts/

stow tmux/

stow vim/

stow mpv/
