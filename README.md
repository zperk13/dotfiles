# dotfiles
My dotfiles. Managed with GNU Stow. Feel free to use this as inspiration for your own dotfiles.

Use `--recursive` when git cloning since this repo has a submodule. If you already cloned non-recursively, that's ok, just run `git submodule init && git submodule update`

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
