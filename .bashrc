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
alias icat='kitty +kitten icat' # If using the Kitty terminal, shows the specified image
alias fetch='fastfetch' # A bunch of neofetch alternatives came out when it was archived, I don't have to worry about which specific one I got, I just aliased it to "fetch" since that is a common word in a lot of the alternatives
alias ls='eza -a --icons auto --group-directories-first' # "--icons auto" should not be necessary according to "eza --help", and yet it is for some reason
alias tree='ls --tree -I .git' # This ls uses the ls alias above. The normal ls command doesn't have a --tree option, eza does. -I .git is to ignore the .git folder (if there is one)
alias G='lazygit' # Mimicking the :G command I have in nvim from tpope's vim-fugitive plugin

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
PS1="${bold}${blue}\w${white} $ ${reset}"

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
    echo -e 'bat\t\tcat alternative'
    echo -e 'dust\t\tdu alternative (disk usage)'
    echo -e 'fetch\t\tSystem info'
    echo -e 'G\t\tlazygit'
    echo -e 'icat\t\tView image'
    echo -e 'jless\t\tJSON viewer'
    echo -e 'h\t\tthis'
    echo -e 'my_local_ip\tPrint local ip'
    echo -e 'my_public_ip\tPrint public ip'
    echo -e 'my_ip\t\tPrint local & public ip'
    echo -e 'nv\t\tNeovim'
    echo -e 'tree\t\tRecursive directory tree'
    echo -e 'y\t\tFile explorer'
    echo -e 'yt-dlp\t\tDownload YouTube videos'
}

# This is just copied from https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# It's apparently important to set up zoxide at the end of the file
# This was just copied from the zoxide README
eval "$(zoxide init --cmd cd bash)"
