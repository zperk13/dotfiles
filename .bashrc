#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export WEBKIT_DISABLE_DMABUF_RENDERER=1 # Makes Tauri apps work

alias grep='grep --color=auto'
alias nv='nvim' # On Windows I use Neovide and that's long to type so I shortened it to nv. I don't use Neovide on Linux, but want to keep the alias
alias bat='bat --theme=gruvbox-dark'
alias icat='kitty +kitten icat' # If using the Kitty terminal, shows the specified image
alias fetch='fastfetch' # A bunch of neofetch alternatives came out when it was archived, I don't have to worry about which specific one I got, I just aliased it to "fetch" since that is a common word in a lot of the alternatives
alias ls='eza --all --icons auto --group-directories-first' # "--icons auto" should not be necessary according to "eza --help", and yet it is for some reason
alias tree='eza --tree --ignore-glob .git'
alias G='lazygit' # Mimicking the :G command I had in nvim from tpope's vim-fugitive plugin
alias s="source ~/.bashrc"
alias tplay="tplay --char-map=█"
alias c="clear"
alias cwd="pwd"
alias monitor="~/.screenlayout/monitor.sh"
alias less="less --raw-control-chars"
alias rg="rg --hidden --no-ignore --glob='!.git/'"
alias toclip="xclip -selection clipboard 1> /dev/null 2> /dev/null" # https://github.com/kovidgoyal/kitty/issues/828#issuecomment-1537144685 for explanation of why I'm piping to /dev/null
alias ..='cd ..'
alias uptime='uptime --pretty'
alias fc='fc -e nvim'
alias rm='trash'
alias net?='ping -c1 -w3 8.8.8.8'

# Setting up color variables. Just copied and pasted this from https://unix.stackexchange.com/a/10065, and then added \[ and \] and renamed "normal" to "reset"
# check if stdout is a terminal...
if test -t 1; then

    # see if it supports colors...
    ncolors=$(tput colors)

    if test -n "$ncolors" && test $ncolors -ge 8; then
        ps_bold="\[$(tput bold)\]"
        bold="$(tput bold)"
        ps_underline="\[$(tput smul)\]"
        underline="$(tput smul)"
        ps_standout="\[$(tput smso)\]"
        standout="$(tput smso)"
        ps_reset="\[$(tput sgr0)\]"
        reset="$(tput sgr0)"
        ps_black="\[$(tput setaf 0)\]"
        black="$(tput setaf 0)"
        ps_red="\[$(tput setaf 1)\]"
        red="$(tput setaf 1)"
        ps_green="\[$(tput setaf 2)\]"
        green="$(tput setaf 2)"
        ps_yellow="\[$(tput setaf 3)\]"
        yellow="$(tput setaf 3)"
        ps_blue="\[$(tput setaf 4)\]"
        blue="$(tput setaf 4)"
        ps_magenta="\[$(tput setaf 5)\]"
        magenta="$(tput setaf 5)"
        ps_cyan="\[$(tput setaf 6)\]"
        cyan="$(tput setaf 6)"
        ps_white="\[$(tput setaf 7)\]"
        white="$(tput setaf 7)"
    fi
fi


# Custom Prompt
# Default is PS1='[\u@\h \W]\$ '
PS1="${ps_bold}${ps_blue}\w${ps_white} $ ${ps_reset}"

PATH="$PATH:~/.cargo/bin"

function d() {
    local dir=$(ls --no-quotes --only-dirs | fzf)
    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}

function o() {
    while true; do
        local thing_to_open
        thing_to_open=$(ls --no-quotes --all --all | fzf) # the double --all shows . and importantly ..
        if (( $? != 0 )); then
            break;
        fi
        if [ -n "$thing_to_open" ]; then
            if [ -d "$thing_to_open" ]; then
                cd "$thing_to_open"
            elif [ -f "$thing_to_open" ]; then
                xdg-open "$thing_to_open"
            fi
        fi
    done
}

function rgb_fg() {
    echo -en "\e[38;2;$1;$2;$3m"
}

function rgb_bg() {
    echo -en "\e[48;2;$1;$2;$3m"
}

function pride() {
    PS1="\[$(rgb_fg 91 206 250)\]\w\[$(rgb_fg 255 255 255)\] $ \[$(rgb_fg 245 169 184)\]"
}

function incognito() {
    set +o history
    PS1="${bold}${red}(incognito) ${blue}\w${white} $ ${reset}"
}

# List of useful programs I installed / scripts I wrote. "h" is short for "help"
function h() {
    echo "${underline}Functions/Aliases:${reset}"
    echo -e '..\t\tcd ..'
    echo -e 'c\t\tclear'
    echo -e 'd\t\tOpen a fuzzy finder of dirs in the current dir, cd into selected one'
    echo -e 'h\t\tthis'
    echo -e 'fetch\t\tSystem info'
    echo -e 'G\t\tlazygit'
    echo -e 'icat\t\tView image'
    echo -e 'incognito\tDisable terminal history'
    echo -e 'monitor\t\tFix monitors'
    echo -e 'net?\t\tCheck if you have internet access by pinging Google once, and waiting up to 3 seconds'
    echo -e 'nv\t\tNeovim'
    echo -e 'o\t\tFile explorer only for opening'
    echo -e 'pride\t\tMakes the prompt have pride colors'
    echo -e 's\t\tReload .bashrc'
    echo -e 'toclip\t\tPipe to toclip to send output to clipboard'
    echo -e 'tree\t\tRecursive directory tree'
    echo -e 'y\t\tFile explorer'

    echo

    echo "${underline}Misc:${reset}"
    echo -e 'bat\t\tcat alternative'
    echo -e 'dust\t\tdu alternative (disk usage)'
    echo -e 'dysk\t\tdf alternative (disk free)'
    echo -e 'exiftool\tFile metadata'
    echo -e 'jless\t\tJSON viewer'
    echo -e 'tldr\t\tCollaborative cheatsheets for console commands'
    echo -e 'tokei\t\tLines of code counter'
    echo -e 'tplay\t\tPlay video in the terminal'
    echo -e 'trash\t\tMove file/directory to trash bin'
    echo -e 'regect\t\tregex 101 like cli tool'
    echo -e 'rg\t\tRipgrep'
    echo -e 'rgr\t\tRepgrep (ripgrep + replace)'
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
