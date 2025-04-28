# dotfiles
My dotfiles. Managed with GNU Stow. Feel free to use this as inspiration for your own dotfiles. You could even just use it yourself if you want.

## Git Cloning (ignore if you're not going to use neovim)
Use `--recursive` when git cloning since this repo has a submodule. If you already cloned non-recursively, that's ok, just run `git submodule init && git submodule update`

## What needs to be installed
### Stow
- [GNU Stow](https://www.gnu.org/software/stow/)
    - symlink manager this entire repo is based off having
### Commands
Some of the stuff the dotfiles expect you to have. Things that it expects but aren't here won't break if you don't have them.
- [eza](https://github.com/eza-community/eza) is used for the `ls` alias.
- [yazi](https://github.com/sxyazi/yazi) it's own bash function ('y') but it's fine if you don't install it.
- [zoxide](https://github.com/ajeetdsouza/zoxide) is used for the `cd` alias.

The `h` command will print out some useful tools, but you don't need to install the stuff. Scripts that use executables that aren't on most Linux systems (eg: I assume grep, sed, and sudo are installed) have checks built to let you know if it needs stuff.

### Things with dotfiles but it's fine if you don't have them installed
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
    - Aliased to `fetch`
- [i3wm](https://i3wm.org/)
- [i3blocks](https://github.com/vivien/i3blocks)
- [kitty](https://github.com/kovidgoyal/kitty)
    - Needed for the `icat` alias
- [neovim](https://github.com/neovim/neovim)
    - Aliased to `nv`

### Dotfiles that I'm assuming you won't need/want to do any installations for
- [.inputrc](.inputrc)
- [.XCompose](.XCompose)

### Things that can be launched by i3wm (Only relevant if you use i3wm)
#### Required for basic functionality if you don't change the config
- [kitty](https://github.com/kovidgoyal/kitty)
    - super+enter
- [rofi](https://github.com/davatorium/rofi)
    - super+d
- [xsetroot](https://archlinux.org/packages/extra/x86_64/xorg-xsetroot/)
    - Runs automatically on login to set the background color to `#282828` (gruvbox bg color)
#### Extra rofi things that can be launched with keybinds (not required)
- [rofi-emoji](https://github.com/Mange/rofi-emoji)
    - super+/
- [rofi-calc](https://github.com/svenstaro/rofi-calc)
    - super+c
#### Other things that can be launched with keybinds (not required)
- [LiveCaptions](https://github.com/abb128/LiveCaptions)
    - super+ctrl+l
- [flameshot](https://github.com/flameshot-org/flameshot)
    - super+shift+s

## bin
I have the [bin](bin) folder which has various scripts. In [.bashrc](.bashrc), I have `~/dotfiles/bin` added to `$PATH` and `bin` in [.stow-local-ignore](stow-local-ignore) so I don't have to run stow every time I add a new script. If you have this git directory cloned somewhere that isn't your home directory, you'll need to change that path in [.bashrc](.bashrc).


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
- [Kitty](.config/kitty/kitty.conf)
- [Neovim](https://github.com/zperk13/nvim/blob/master/lua/plugins/colorscheme.lua)
    - [Neovim plugin: lualine](https://github.com/zperk13/nvim/blob/master/lua/plugins/lualine.lua)
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
