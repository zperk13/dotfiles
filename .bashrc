#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Setting up color variables. Just copied and pasted this from https://unix.stackexchange.com/a/10065, and then added \[ and \] and renamed "normal" to "reset"
# check if stdout is a terminal...
if test -t 1; then

    # see if it supports colors...
    ncolors=$(tput colors)

    if test -n "$ncolors" && test $ncolors -ge 8; then
        bold="\[$(tput bold)\]"
        underline="\[$(tput smul)\]"
        standout="\[$(tput smso)\]"
        reset="\[$(tput sgr0)\]"
        black="\[$(tput setaf 0)\]"
        red="\[$(tput setaf 1)\]"
        green="\[$(tput setaf 2)\]"
        yellow="\[$(tput setaf 3)\]"
        blue="\[$(tput setaf 4)\]"
        magenta="\[$(tput setaf 5)\]"
        cyan="\[$(tput setaf 6)\]"
        white="\[$(tput setaf 7)\]"
    fi
fi


# Custom Prompt
# Default is PS1='[\u@\h \W]\$ '
PS1="${bold}${red}\@ ${blue}\w${reset}\n$ "
