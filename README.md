# dotfiles
My dotfiles. Managed with GNU Stow. Feel free to use this as inspiration for your own dotfiles. You could even just use it yourself if you want.

## Git Cloning (ignore if you're not going to use neovim)
Use `--recursive` when git cloning since this repo has a submodule. If you already cloned non-recursively, that's ok, just run `git submodule init && git submodule update`

## What needs to be installed
- [GNU Stow](https://www.gnu.org/software/stow/)
    - symlink manager this entire repo is based off having
### Things won't work well in Bash if you don't unalias stuff
- [eza](https://github.com/eza-community/eza)
    - I have `ls` aliased to it
- [zoxide](https://github.com/ajeetdsouza/zoxide)
    - I have `cd` aliased to it
### Things used by a Bash function/alias but if you don't use those, things will be fine
- [bat](https://github.com/sharkdp/bat)
- [curl](https://github.com/curl/curl)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [ffmpeg](https://ffmpeg.org/)
- [gifski](https://github.com/ImageOptim/gifski)
- [kitty](https://github.com/kovidgoyal/kitty)
    - Terminal emulator. One of the bash aliases will only work in kitty (see [icat](https://sw.kovidgoyal.net/kitty/kittens/icat/))
- [lazygit](https://github.com/jesseduffield/lazygit)
- [neovim](https://github.com/neovim/neovim)
- [yazi](https://github.com/sxyazi/yazi)
### Useful tools referenced in the Bash h() function but aren't needed (and weren't mentioned above)
- [dust](https://github.com/bootandy/dust)
- [jless](https://github.com/PaulJuliusMartinez/jless)
- [tokei](https://github.com/XAMPPRocky/tokei)
### Things with dotfiles (that weren't already mentioned) but it's fine if you don't have them installed
- [i3wm](https://i3wm.org/)
- [i3blocks](https://github.com/vivien/i3blocks)
- [tmux](https://github.com/tmux/tmux)
### Dotfiles that I'm assuming you won't need/want to do any installations for
- .inputrc
- .Xcompose

## userChrome.css
userChrome.css is a file for modifying Firefox's user interface. [userchrome.org](https://www.userchrome.org/) has more information about it and some of the following stuff is based on information from it.

The location userChrome.css should go to is less standard than other stuff in this repo, so it's in the .stow-local-ignore file. If you want to use it, you'll need to manually symlink it (you could copy it instead if you want but symlink will let us keep it in a nice spot).

1. [Locate your currently active profile folder](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data)
2. Open that folder in the terminal.
3. `mkdir chrome`
4. `cd chrome`
5. `ln -s ~/dotfiles/userChrome.css ./userChrome.css`
    - I keep my version of this repo in the home directory. If you don't, you'll need to change the first path accordingly.
6. [Set Firefox to look for userChrome.css at startup](https://www.userchrome.org/how-create-userchrome-css.html#aboutconfig)
