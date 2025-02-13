# dotfiles
My dotfiles. Managed with GNU Stow. Feel free to use this as inspiration for your own dotfiles. You could even just use it yourself if you want.

## Git Cloning (ignore if you're not going to use neovim)
Use `--recursive` when git cloning since this repo has a submodule. If you already cloned non-recursively, that's ok, just run `git submodule init && git submodule update`

## What needs to be installed
### Stow
- [GNU Stow](https://www.gnu.org/software/stow/)
    - symlink manager this entire repo is based off having
### Commands
The most "necessary" things here are the things with a common command aliased to it as those common commands won't work without them, but you can also just unalias them if you want. Everything else, you can pick and choose.
| | Common cmd aliased to it | Replacement for common cmd | Has self alias [1] | Has shorter alias | Used in | In h [2] | Has dotfiles in repo |
|-|-|-|-|-|-|-|-|
| [bat](https://github.com/sharkdp/bat) | ❌ | cat | ✅ | ❌ | ❌ | ✅ | ❌ | 
| [dust](https://github.com/bootandy/dust) | ❌ | du | ❌ | ❌ | ❌ | ✅ | ❌ |
| [curl](https://github.com/curl/curl) | ❌ | ❌ | ❌ | ❌ | my_ip my_public_ip | ❌ | ❌ |
| [exiftool](https://github.com/exiftool/exiftool) | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| [eza](https://github.com/eza-community/eza) | ls | ls | ✅ | ❌ | tree | ❌ | ❌ |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) [3] | ❌ | ❌ | ❌ | fetch | ❌ | ✅ | [✅](.config/fastfetch/config.jsonc) |
| [ffmpeg](https://ffmpeg.org/) | ❌ | ❌ | ❌ | ❌ | fps gif duration | ❌ | ❌ |
| [gifski](https://github.com/ImageOptim/gifski) | ❌ | ❌ | ❌ | ❌ | gif | ❌ | ❌ |
| [jless](https://github.com/PaulJuliusMartinez/jless) | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| [kitty](https://github.com/kovidgoyal/kitty) [4] | ❌ | ❌ | ❌ |  ❌ | icat [4] | ❌ | [✅](.config/kitty/kitty.conf) |
| [lazygit](https://github.com/jesseduffield/lazygit) | ❌ | ❌ | ❌ | G | ❌ | ✅ | ❌ |
| [neovim](https://github.com/neovim/neovim) | ❌ | ❌ | ❌ | nv [5] | ❌ | ✅ | [✅](https://github.com/zperk13/nvim/) [6] |
| [tokei](https://github.com/XAMPPRocky/tokei) | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| [tmux](https://github.com/tmux/tmux) | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | [✅](.config/tmux/tmux.conf) |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | ❌ | grep | ❌ | ❌ | ❌ | ✅ | ❌ |
| [repgrep](https://github.com/acheronfail/repgrep) | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| [yazi](https://github.com/sxyazi/yazi) | ❌ | ❌ | ❌ | ❌ [7] | y [7] | ✅ | [✅](.config/yazi/yazi.toml) |
| [yt-dlp](https://github.com/yt-dlp/yt-dlp) | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | cd | cd | ❌ | ❌ | ❌ | ❌ | ❌ |

- [1] For default options. (eg: `alias grep='grep --color=auto'`)
- [2] [.bashrc](.bashrc) defines a custom function `h` (short for "help") which lists out some useful commands.
- [3] If you're using fastfetch and a Desktop Enviorment (DE) instead of a Window Manager (WM), you might want to tweak the [fastfetch config](.config/fastfetch/config.jsonc) as it doesn't have a DE module.
- [4] Terminal emulator. One of the bash aliases will only work in kitty (see [icat](https://sw.kovidgoyal.net/kitty/kittens/icat/)).
- [5] On Windows I use [Neovide](https://github.com/neovide/neovide) and that's long to type so I shortened it to nv. I don't use Neovide on Linux, but want to keep the alias.
- [6] As a submodule.
- [7] [Shortened to `y` but it's a function for the ability to leave it and the CWD be where it left.
](https://yazi-rs.github.io/docs/quick-start#shell-wrapper)

### Things with dotfiles but it's fine if you don't have them installed
- [i3wm](https://i3wm.org/)
- [i3blocks](https://github.com/vivien/i3blocks)
### Dotfiles that I'm assuming you won't need/want to do any installations for
- [.inputrc](.inputrc)
- [.XCompose](.XCompose)

### Things that can be launched by i3wm (Only relevant if you use i3wm)
#### Required for basic functionality if you don't change the config
- [kitty](https://github.com/kovidgoyal/kitty)
    - super+enter
- [rofi](https://github.com/davatorium/rofi)
    - super+d
#### Extra rofi things that can be launched with keybinds (not required)
- [rofi-emoji](https://github.com/Mange/rofi-emoji)
    - super+/
- [rofi-calc](https://github.com/svenstaro/rofi-calc)
    - super+c
#### Other things that can be launched with keybinds (not required)
- [LiveCaptions](https://github.com/abb128/LiveCaptions)
    - super+ctrl+l
- [flameshot](https://github.com/flameshot-org/flameshot)
    - super+shift+c


## Font
Multiple files assume you have [JetBrains Mono](https://www.jetbrains.com/lp/mono/) installed. If you don't have it, nothing will break, but I highly reccomend you either use it or another [nerd font](https://www.nerdfonts.com/) and change the configs to use your preferred nerd font. Here's a list of files that reference JetBrains Mono:
- [.config/kitty/kitty.conf](.config/kitty/kitty.conf)
- [.config/i3/config](.config/i3/config)
- [.config/nvim/lua/neovide.lua](https://github.com/zperk13/nvim/blob/master/lua/neovide.lua)

## Colorscheme
My preferred colorscheme is gruvbox. You don't need to do any steps other than installing this repo to use it, all the config files handle it.
### Files that set up gruvbox
- [Bash](.bashrc)
- [i3wm](.config/i3/config)
- [Kitty](.config/tmux/tmux.conf)
- [Neovim](https://github.com/zperk13/nvim/blob/master/lua/plugins/colorscheme.lua)
    - [Neovim plugin: lualine](https://github.com/zperk13/nvim/blob/master/lua/plugins/lualine.lua)
- [tmux](.config/tmux/tmux.conf)
### Things I have using gruvbox but not via config files
- [Firefox](https://www.mozilla.org/firefox/)
- [Thunderbird](https://www.thunderbird.net)
### usercss
I have Gruvbox (and other small tweaks) applied to websites on Firefox using CSS. That stuff is in https://github.com/zperk13/usercss

## userChrome.css
[userChrome.css](userChrome.css) is a file for modifying Firefox's user interface. [userchrome.org](https://www.userchrome.org/) has more information about it and some of the following stuff is based on information from it.

The location userChrome.css should go to is less standard than other stuff in this repo, so it's in the .stow-local-ignore file. If you want to use it, you'll need to manually symlink it (you could copy it instead if you want but symlink will let us keep it in a nice spot).

1. [Locate your currently active profile folder](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data)
2. Open that folder in the terminal.
3. `mkdir chrome`
4. `cd chrome`
5. `ln -s ~/dotfiles/userChrome.css ./userChrome.css`
    - I keep my version of this repo in the home directory. If you don't, you'll need to change the first path accordingly.
6. [Set Firefox to look for userChrome.css at startup](https://www.userchrome.org/how-create-userchrome-css.html#aboutconfig)
