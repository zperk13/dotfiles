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
alias ls='eza -a --icons auto --group-directories-first' # "--icons auto" should not be necessary according to "eza --help", and yet it is for some reason
alias tree='ls --tree -I .git' # This ls uses the ls alias above. The normal ls command doesn't have a --tree option, eza does. -I .git is to ignore the .git folder (if there is one)
alias G='lazygit' # Mimicking the :G command I have in nvim from tpope's vim-fugitive plugin
alias s="source ~/.bashrc"
alias c="clear"
alias cwd="pwd"

export PATH="~/.cargo/bin:$PATH"

alias whisper='whisper --language en --task transcribe --fp16 False --device cuda --model turbo'
# I picked the models and the --fp16 flag based on my hardware and uses. Might not be the best thing for you to copy but feel free to take inspiration from it. Or just copy it, I'm not your boss.

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

function duration() {
    ffmpeg -i "$1" 2>&1 | grep -Go 'Duration: [0-9.:]\+' | grep -Go ' [0-9.:]\+' | grep --color=never -Go '[0-9.:]\+'
}

function fps() {
    ffmpeg -i "$1" 2>&1 | grep -Go '[0-9.]\+ fps' | grep --color=never -Go '[0-9.]\+'
}

function gif() {
    if [ -z "$1" ]; then echo 'need one parameter (the input file)'; else
        local fps_variable="$(fps $1)"
        local timestamp="$(date +%s)"
        local dir="/tmp/gif$timestamp"
        mkdir "$dir"
        ffmpeg -i "$1" "${dir}/frame%04d.png"
        # gifski: https://gif.ski/
        # I installed it with `cargo install gifski` then added ~/.cargo/bin to the path towards a few dozen lines above this
        gifski -o "${timestamp}.gif" --fps ${fps_variable} ${dir}/frame*.png
    fi
}

# This thing isn't perfect, but I have spent hours improving it, it works good enough, I'm happy with it
function isolate() {
    # list all files, only get the ones that have a dot in them that isn't at the start, and only get everything before that first non-start dot
    files_with_dots_without_dots=$(eza --only-files --no-quotes | rg -o "^(.+?)\." -r '$1');

    # Go through all of those, remove duplicats ("abc.txt" and "abc.mp4" both become "abc")
    echo "$files_with_dots_without_dots" | uniq | while read uniq_file_start ; do
        # Make directory with that file-extension-less name
        echo "Making directory ${blue}${bold}${uniq_file_start}${reset}";
        mkdir "$uniq_file_start";

        # Save the length of that string for later
        len=${#uniq_file_start};

        # Get all files that have that file-extension-less name in it
        files_with_start=$(eza --only-files --no-quotes | rg -F "$uniq_file_start");

        # iterate through those
        echo "$files_with_start" | while read file ; do

            # make sure it actually starts with it
            sliced=${file:0:$len};
            if [ "$sliced" == "$uniq_file_start" ]; then

                # Move the file into to created folder
                echo "Moving ${magenta}${bold}${file}${reset} into ${blue}${bold}${uniq_file_start}${reset}"
                mv "$file" "$uniq_file_start"
            fi
        done
    done
}

function incognito() {
    set +o history
    PS1="${bold}${red}(incognito) ${blue}\w${white} $ ${reset}"
}

# List of useful programs I installed / bash functions I wrote in this file. "h" is short for "help"
function h() {
    echo -e 'bat\t\tcat alternative'
    echo -e 'duration\tGet the duration of a file'
    echo -e 'dust\t\tdu alternative (disk usage)'
    echo -e 'exiftool\tFile metadata'
    echo -e 'fetch\t\tSystem info'
    echo -e 'fps\t\tGet the fps of a video'
    echo -e 'G\t\tlazygit'
    echo -e 'gif\t\tTurn a video into a gif'
    echo -e 'icat\t\tView image'
    echo -e 'incognito\tDisable terminal history'
    echo -e 'jless\t\tJSON viewer'
    echo -e 'h\t\tthis'
    echo -e 'my_local_ip\tPrint local ip'
    echo -e 'my_public_ip\tPrint public ip'
    echo -e 'my_ip\t\tPrint local & public ip'
    echo -e 'nv\t\tNeovim'
    echo -e 'tokei\t\tLines of code counter'
    echo -e 'tree\t\tRecursive directory tree'
    echo -e 'regect\t\tregex 101 like cli tool'
    echo -e 'rg\t\tRipgrep'
    echo -e 'rgr\t\tRepgrep (ripgrep + replace)'
    echo -e 'whisper\t\tTranscribe a video/audio file'
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
