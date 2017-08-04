#!/bin/bash
remove_files () {
   arr=("$@")
   for i in "${arr[@]}";
      do
        if [[ -L "${i}" ]]; then
            echo "    - Removing $i"
        fi
      done
}

clean_up () {
   echo "Cleaning up $1"
}

echo "CLEANING UP ALL SYMBOLIC LINKED CONFING FILES!"
echo ""

# standard config
clean_up "standard config"
files=("$HOME/.fonts" "$HOME/.gitkeep" "$HOME/scripts" "$HOME/.shell_aliases" "$HOME/.shell_env" "$HOME/.xinitrc")
remove_files "${files[@]}"

# Awesome
clean_up "awesome"
files=("$HOME/.config/awesome")
remove_files "${files[@]}"


# Bash
clean_up "Bash"
files=("$HOME/.bash_logout" "$HOME/.bash_profile" "$HOME/.bashrc")
remove_files "${files[@]}"

# GIMP
clean_up "GIMP"
files=("$HOME/.gimp-2.8")
remove_files "${files[@]}"

# git
clean_up "git"
files=("$HOME/.config/git")
remove_files "${files[@]}"

# mpd
clean_up "mpd"
files=("$HOME/.mpd")
remove_files "${files[@]}"

# mpv
clean_up "mpv"
files=("$HOME/.mpv")
remove_files "${files[@]}"

# ncmpcpp
clean_up "ncmpcpp"
files=("$HOME/.ncmpcpp")
remove_files "${files[@]}"

# qutebrowser
clean_up "qutebrowser"
files=("$HOME/.config/qutebrowser")
remove_files "${files[@]}"

# redshift
clean_up "redshift"
files=("$HOME/.config/redshift.conf")
remove_files "${files[@]}"

# redshift
clean_up "terminator"
files=("$HOME/.config/terminator")
remove_files "${files[@]}"

# tmux
clean_up "tmux"
files=("$HOME/.tmux" "$HOME/.tmux.conf" "$HOME/.tmuxp")
remove_files "${files[@]}"

# Vim
clean_up "Vim"
files=("$HOME/.vim" "$HOME/.vimrc" "$HOME/.config/flake8" "$HOME/.config/Bitcoin")
remove_files "${files[@]}"

# zsh
clean_up "zsh"
files=("$HOME/.zshrc" "$HOME/.config/oh-my-zsh")
remove_files "${files[@]}"
