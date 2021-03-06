
# ~/.bashrc
#
if [ -f ~/.shell_env ]; then
    source ~/.shell_env
fi

export MPD_PORT=6601
export PHANTOMJS_BIN=~/bin/phantomjs
export VISUAL=vim
export TERM=xterm-256color
export HISTFILE=$HOME/.bash_history
export PATH=~/bin:$PATH
export PATH=~/scripts:$PATH
export PATH=~/scripts/control:$PATH
export PATH=~/funcs:$PATH
export WEECHAT_HOME=$HOME/.config/weechat

export WORKON_HOME=$HOME/.local/virtualenv 


if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


alias eA='vim ~/.config/awesome/rc.lua'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.shell_aliases ]; then
    source ~/.shell_aliases
fi

# Sets the Mail Environment Variable
MAIL=/var/spool/mail/gpu && export MAIL


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='($?)${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[0;35m\]\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\] $PS1 "
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# export NVM_DIR="/home/gpu/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# export NVIM_RC="$HOME/.config/nvim/init.vim"
# alias nvim="VIMRUNTIME=/usr/share/vim/vim74 $HOME/opt/neovim/build/bin/nvim"

## from http://robots.thoughtbot.com/
function tmuxnew () {
    if [ -z "$1" ]
    then
        s_name=$(basename $PWD | tr . -)
    else
        s_name="$1"
    fi
    tmux new -d -s $s_name
    tmux switch-client -t $s_name
}

function tmuxopen () {
    tmux_session=$(tmux ls 2>&1 | head -1 | awk '{print $1}' | tr -d :)
    if [ "$tmux_session" = "failed" ]; then
        tmuxnew base
    else
        echo run tmux new
        tmuxnew "$tmux_session"
    fi
}
TMUX_BACK=$TMUX



#if which ruby >/dev/null && which gem >/dev/null; then PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH" fi
[ ! -d /tmp/$USER ] && mkdir /tmp/$USER

#setxkbmap -option  caps:super
$(~/scripts/banner/randomBanner.py)
