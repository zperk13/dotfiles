#
# ~/.bashrc
#

# shellcheck shell=bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT="%s "

export WEBKIT_DISABLE_DMABUF_RENDERER=1 # Makes Tauri apps work
export BAT_THEME='gruvbox-dark'
eval "$(batman --export-env)"

alias ..='cd ..'
alias batgrep="batgrep --hidden --no-ignore --glob='!.git/' --glob='!.mypy_cache/'" # Same arguments as rg alias
alias c="clear"
alias cp='cp -i' # Prompt before overwrite
alias cwd="pwd"
alias fc='fc -e nvim'
alias fetch='fastfetch' # A bunch of neofetch alternatives came out when it was archived, I don't have to worry about which specific one I got, I just aliased it to "fetch" since that is a common word in a lot of the alternatives
alias G='lazygit' # Mimicking the :G command I had in nvim from tpope's vim-fugitive plugin
alias gz='gzip'
alias fd='fd --hidden --no-ignore-vcs'
alias funcat='figlet -t | cowsay -f sus -n | lolcat --force | tte --existing-color-handling always pour'
alias grep='grep --color=auto'
alias icat='kitty +kitten icat' # If using the Kitty terminal, shows the specified image
alias less="less --raw-control-chars"
alias ls='eza --all --icons auto --group-directories-first'
alias man='batman'
alias monitor="~/.screenlayout/monitor.sh"
alias net\?='ping -c 1 -W 3 8.8.8.8'
alias pcp='rsync --archive --partial --info=progress2,stats1,name'
alias rg="rg --hidden --no-ignore --glob='!.git/' --glob='!.mypy_cache/'"
alias rm='trash'
alias s="source ~/.bashrc"
alias stui='systemctl-tui'
alias toclip="xclip -selection clipboard 1> /dev/null 2> /dev/null" # https://github.com/kovidgoyal/kitty/issues/828#issuecomment-1537144685 for explanation of why I'm piping to /dev/null
alias tplay="tplay --char-map=█"
alias tree='eza --tree --ignore-glob .git'
alias uptime='uptime --pretty'
alias yt-dlp='yt-dlp --write-auto-subs --write-subs'


# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Setting up color variables. Just copied and pasted this from https://unix.stackexchange.com/a/10065, and then added \[ and \] and renamed "normal" to "reset"
# check if stdout is a terminal...
if test -t 1; then

    # see if it supports colors...
    ncolors=$(tput colors)

    # Disable unused variable check
    # shellcheck disable=SC2034
    if test -n "$ncolors" && test "$ncolors" -ge 8; then
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
function prompt_command {
    local exit_code="$?"
    local now prev_command prev_command_timestamp ps range diff exit_code
    ps=''
    if [ "$SECONDS" != 0 ]; then
        now="$(date +%s)"
        readarray -d' ' prev_command <<< "$(history | tail -n1)" # I think this might have an issue with multiline commands?
        prev_command_timestamp="${prev_command[3]}"
        diff=$((now - prev_command_timestamp))
        range="$(seq 1 "$COLUMNS")"
        if set -o | rg history | rg off >/dev/null; then
            ps="$ps$(printf -- '─%.0s' $range)\n"
            if [ "$SECONDS" != 0 ]; then
                ps="$ps${ps_bold}${ps_red}(incognito) "
            fi
        elif echo "${prev_command[@]}" | tr  '\n' ' ' | rg -v '\s*\d+\s+\d+\s+c(lear)?\s*$' > /dev/null; then
            echo "start$(echo "${prev_command[@]}" | tr '\n' ' ')end"
            if [ "$exit_code" == 0 ]; then
                exit_code="$ps_green(Exit Code: 0)"
            else
                exit_code="$ps_red(Exit Code: $exit_code)"
            fi
            ps="$ps$exit_code$ps_reset"
            if [ "$diff" != 0 ]; then
                ps="$ps$ps_reset Elapsed: ${diff}s"
            fi
            ps="$ps\n$(printf -- '─%.0s' $range)\n"
        fi
    fi
    ps="$ps${ps_bold}${ps_blue}\w${ps_white}\n$ ${ps_reset}"
    PS1="$ps"
}
PROMPT_COMMAND=prompt_command 

function nv() {
    # On Windows I use Neovide and that's long to type so I shortened it to nv. I don't use Neovide on Linux, but want to keep the alias.
    # Also I got annoyed by forgetting to do sudoedit instead of nv in certain situations, so this just checks that for me
    if [ -z "$1" ]; then
        nvim
        return
    fi
    local perm_to_check="."
    if [ -f "$1" ]; then
        perm_to_check="$1"
    fi
    if [ -w "$perm_to_check" ]; then
        nvim "$1"
    else
        sudoedit "$1"
    fi
}

function bathelp() {
    "$@" --help 2>&1 | bat --plain --language=help
}

function incognito() {
    set +o history
}

# List of some aliases / programs I installed / functions I wrote. "h" is short for "help"
function h() {
    echo "${underline}Functions/Aliases:${reset}"
    echo -e '..\t\tcd ..'
    echo -e 'bathelp\t\t--help + bat' # https://github.com/eth-p/bat-extras
    echo -e 'c\t\tclear'
    echo -e 'cwd\t\tpwd'
    echo -e 'h\t\tthis'
    echo -e 'fetch\t\tSystem info'
    echo -e 'funcat\t\tPipe into this for fun'
    echo -e 'G\t\tlazygit' # https://github.com/jesseduffield/lazygit
    echo -e 'gz\t\tgzip'
    echo -e 'icat\t\tView image'
    echo -e 'incognito\tDisable terminal history'
    echo -e 'monitor\t\tFix monitors'
    echo -e 'net?\t\tCheck if you have internet access by pinging Google once, and waiting up to 3 seconds'
    echo -e 'nv\t\tNeovim (checks if needs sudo too)'
    echo -e 'pcp\t\tprogress cp'
    echo -e 's\t\tReload .bashrc'
    echo -e 'stui\t\tsystemctl-tui' # https://github.com/rgwood/systemctl-tui
    echo -e 'smallprompt\tRemoves the directory from your prompt'
    echo -e 'toclip\t\tPipe to toclip to send output to clipboard'
    echo -e 'tree\t\tRecursive directory tree'
    echo -e 'y\t\tYazi. TUI File explorer'

    echo

    echo "${underline}Misc:${reset}"
    echo -e 'bat\t\tcat alternative' # https://github.com/sharkdp/bat
    echo -e 'batdiff\t\tbat+diff' # https://github.com/eth-p/bat-extras
    echo -e 'batgrep\t\tbat+ripgrep' # https://github.com/eth-p/bat-extras
    echo -e 'batwatch\tWatch for changes in files or command output, and print them with bat' # https://github.com/eth-p/bat-extras
    echo -e 'chat_downloader\tDownload live chat from YouTube/Twitch' # https://github.com/Indigo128/chat-downloader/
    echo -e 'dust\t\tdu alternative (disk usage)' # https://github.com/bootandy/dust
    echo -e 'dysk\t\tdf alternative (disk free)' # https://github.com/Canop/dysk
    echo -e 'exiftool\tFile metadata' # https://github.com/exiftool/exiftool
    echo -e 'fc\t\tEdit the most recent command'
    echo -e 'fd\t\tfind alternative' # https://github.com/sharkdp/fd
    echo -e 'jless\t\tJSON viewer' # https://github.com/PaulJuliusMartinez/jless
    echo -e 'L_bash_profile\tBash script profiler' # https://github.com/Kamilcuk/L_bash_profile
    echo -e 'scenedetect\tSplit video up into scenes' # https://github.com/Breakthrough/PySceneDetect
    echo -e 'tte\t\tTerminalTextEffects' # https://github.com/ChrisBuilds/terminaltexteffects
    echo -e 'tldr\t\tCollaborative cheatsheets for console commands (actually tealdeer)' # https://github.com/tealdeer-rs/tealdeer
    echo -e 'tokei\t\tLines of code counter' # https://github.com/XAMPPRocky/tokei
    echo -e 'tplay\t\tPlay video in the terminal' # https://github.com/maxcurzi/tplay
    echo -e 'trash\t\tMove file/directory to trash bin (rm is aliased to it)' # https://github.com/andreafrancia/trash-cli
    echo -e 'regect\t\tregex 101 like cli tool' # https://github.com/kloki/regect
    echo -e 'rg\t\tRipgrep. Grep alternative' # https://github.com/BurntSushi/ripgrep
    echo -e 'rgr\t\tRepgrep (ripgrep + replace)' # https://github.com/acheronfail/repgrep
    echo -e 'yt-dlp\t\tDownload videos' # https://github.com/yt-dlp/yt-dlp

    echo

    echo "${underline}keybinds:${reset}"
    echo -e 'ctrl+r\t\tHistory'
    echo -e 'ctrl+t\t\tFiles'
    echo -e 'alt+c\t\tcd'
    echo -e "**<TAB>\t\tPattern mathching. Can be extended. eg: ${bold}../**${reset}, ${bold}.mp4**${reset}, ${bold}~/**${reset}"
    echo -e 'ctrl+shift+h\tView scrollback in nvim'
    echo -e 'ctrl+shift+g\tView output of previous command in nvim'
    echo -e 'ctr+x ctrl+e\tView output of previous command in nvim'
}

export FZF_CTRL_R_OPTS="--reverse"
eval "$(fzf --bash)"

# shellcheck disable=all
# This is just copied from https://yazi-rs.github.io/docs/quick-start#shell-wrapper, with the shellcheck comments add in by me
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
