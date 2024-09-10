#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# Everything above this comment was the default .bashrc file

alias nv='nvim' # On Windows I use Neovide and that's long to type so I shortened it to nv. I don't use Neovide on Linux, but want to keep the alias
alias bat='bat --theme=gruvbox-dark'
alias icat='kitty +kitten icat'

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

function my_local_ip() {
    ip addr | grep -Go 'inet 192.168.[0-9]\+.[0-9]\+' | grep --color=never -Go '[1-9.]\+'
}

function my_public_ip() {
    curl -s https://checkip.amazonaws.com
}

function my_ip() {
    my_local_ip
    my_public_ip
}

# List of useful programs I installed / bash functions I wrote in this file. "h" is short for "help"
function h() {
    echo -e 'bat\t-\tcat alternative'
    echo -e 'dust\t-\tdu alternative (disk usage)'
    echo -e 'icat\t-\tView image'
    echo -e 'jless\t-\tJSON viewer'
    echo -e 'h\t-\tthis'
    echo -e 'my_local_ip\t-\tPrint local ip'
    echo -e 'my_public_ip\t-\tPrint public ip'
    echo -e 'my_ip\t-\tPrint local & public ip'
    echo -e 'nv\t-\tNeovim'
    echo -e 'yt-dlp\t-\tDownload YouTube videos'
}

# It's apparently important to set up zoxide at the end of the file
# This was just copied from the zoxide README
eval "$(zoxide init --cmd cd bash)"
