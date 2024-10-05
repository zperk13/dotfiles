# dotfiles
My dotfiles. Managed with GNU Stow. Feel free to use this as inspiration for your own dotfiles. You could even just use it yourself if you want.

## Git Cloning (ignore if you're not going to use neovim)
Use `--recursive` when git cloning since this repo has a submodule. If you already cloned non-recursively, that's ok, just run `git submodule init && git submodule update`

## What needs to be installed
### Stow
- [GNU Stow](https://www.gnu.org/software/stow/)
    - symlink manager this entire repo is based off having
### Commands
| | Common command aliased to it | Replacement for common command | Has alias for itself for default options  | Has shortening alias | Used in custom bash function(s) or different alias | In h | Has dotfiles in this repo |
|-|-|-|-|-|-|-|-|
| [bat](https://github.com/sharkdp/bat) | ❌ | cat | --theme=gruvbox-dark | ❌ | ❌ | ✅ | ❌ | 
| [dust](https://github.com/bootandy/dust) | ❌ | du | ❌ | ❌ | ❌ | ✅ | ❌ |
| [curl](https://github.com/curl/curl) | ❌ | ❌ | ❌ | ❌ | my_ip my_public_ip | ❌ | ❌ |
| [eza](https://github.com/eza-community/eza) | ls | ls | ❌ | ❌ | tree | ❌ | ❌ |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) [1] | ❌ | ❌ | ❌ | fetch | ❌ | ✅ | ✅ |
| [ffmpeg](https://ffmpeg.org/) | ❌ | ❌ | ❌ | ❌ | fps gif | ❌ | ❌ |
| [gifski](https://github.com/ImageOptim/gifski) | ❌ | ❌ | ❌ | ❌ | gif | ❌ | ❌ |
| [jless](https://github.com/PaulJuliusMartinez/jless) | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| [kitty](https://github.com/kovidgoyal/kitty) [2] | ❌ | ❌ | ❌ |  ❌ | icat [2] | ❌ | ✅ |
| [lazygit](https://github.com/jesseduffield/lazygit) | ❌ | ❌ | ❌ | G | ❌ | ✅ | ❌ |
| [neovim](https://github.com/neovim/neovim) | ❌ | ❌ | ❌ | nv [3] | ❌ | ✅ | ✅ [4] |
| [tokei](https://github.com/XAMPPRocky/tokei) | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| [tmux](https://github.com/tmux/tmux) | 
| [yazi](https://github.com/sxyazi/yazi) | ❌ | ❌ | ❌ | ❌ [5] | ✅ [5] | ✅ | ✅ |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | cd | cd | ❌ | ❌ | ❌ | ❌ | ❌ |

- [1] If you're using fastfetch and a Desktop Enviorment (DE) instead of a Window Manager (WM), you might want to tweak the fastfetch config as it doesn't have a DE module.
- [2] Terminal emulator. One of the bash aliases will only work in kitty (see [icat](https://sw.kovidgoyal.net/kitty/kittens/icat/))
- [3] On Windows I use [Neovide](https://github.com/neovide/neovide) and that's long to type so I shortened it to nv. I don't use Neovide on Linux, but want to keep the alias
- [4] As a submodule
- [5] [Shortened to `y` but it's a function for the ability to leave it and the CWD be where it left
](https://yazi-rs.github.io/docs/quick-start#shell-wrapper)

### Things with dotfiles but it's fine if you don't have them installed
- [i3wm](https://i3wm.org/)
- [i3blocks](https://github.com/vivien/i3blocks)
### Dotfiles that I'm assuming you won't need/want to do any installations for
- .inputrc
- .Xcompose

## Font
Multiple files assume you have [JetBrains Mono](https://www.jetbrains.com/lp/mono/) installed. If you don't have it, nothing will break, but I highly reccomend you either use it or another [nerd font](https://www.nerdfonts.com/) and change the configs to use your preferred nerd font. Here's a list of files that reference JetBrains Mono:
- .config/kitty/kitty.conf
- .config/i3/config
- .config/nvim/lua/neovide.lua

## userChrome.css
userChrome.css is a file for modifying [Firefox](https://www.mozilla.org/firefox/)'s user interface. [userchrome.org](https://www.userchrome.org/) has more information about it and some of the following stuff is based on information from it.

The location userChrome.css should go to is less standard than other stuff in this repo, so it's in the .stow-local-ignore file. If you want to use it, you'll need to manually symlink it (you could copy it instead if you want but symlink will let us keep it in a nice spot).

1. [Locate your currently active profile folder](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data)
2. Open that folder in the terminal.
3. `mkdir chrome`
4. `cd chrome`
5. `ln -s ~/dotfiles/userChrome.css ./userChrome.css`
    - I keep my version of this repo in the home directory. If you don't, you'll need to change the first path accordingly.
6. [Set Firefox to look for userChrome.css at startup](https://www.userchrome.org/how-create-userchrome-css.html#aboutconfig)

## Colorscheme
My preferred colorscheme is gruvbox. You don't need to do any steps other than installing this repo to use it, all the config files handle it. This section is just here for anyone wondering what color scheme I use but doesn't want to dig through the files. Also it's for this:
### Things I have using gruvbox but not via config files
- [Firefox](https://www.mozilla.org/firefox/)
- [Thunderbird](https://www.thunderbird.net)
