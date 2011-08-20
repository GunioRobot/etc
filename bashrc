# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

PS1='\u@\h:\W\$ '

HISTCONTROL=ignoreboth
HISTSIZE=1000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# add ~/bin to PATH if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# add super-user binaries to PATH
PATH="$PATH:/sbin:/usr/sbin"

# enable bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# enable colour support of ls and add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# aliases
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -A'
alias llha='ls -lhA'
alias l='ls -CF'

alias g='git'
alias tm='tmux'

# enable colours in less
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# list processes which are using a deleted map file after a system update and need to be restarted
alias dm="sudo lsof | grep 'DEL.*lib' | cut -d ' ' -f 1 | sort -u"

# allows java graphical programs to run in tiling window managers by impersonating
# a window manager in JVM's list of allowed non-re-parenting window managers
if [ -x /usr/bin/wmname ]; then
    wmname LG3D 2> /dev/null
fi
