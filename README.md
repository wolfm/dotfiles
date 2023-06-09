# Dotfiles

Welcome to my dotfiles!

## Stuff that's not automated yet

### Firefox
- Set firefox theme to Nord (in "Themes and Addons")
	- This other theme may match the Nordic gnome theme better: [link](https://github.com/EliverLara/firefox-nordic-theme)
- Install Bitwarden extension

### SSH Key
- Manually add it to github
- Manually add it to gitlab

### Apt package
- zsh
- curl
- make (neovim)
- cmake (neovim)
- gettext (neovim)
- python3-pip (all kind of things, but specifically, hydralisk-ansible)

### Zsh
- Depends on Apt Package (zsh, curl)
- Set my default shell to zsh
- Download and install oh-my-zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Dotfiles
- Depends on SSH Key
- clone into `~/dotfiles`
- Run `~/dotfiles/install`

### Gnome:
- Move dock to bottom
- Hide dock by default
- Use [Nord theme](https://github.com/EliverLara/Nordic)

### Gnome Terminal:
- Clone github repo and run script: Instructions [here](https://github.com/nordtheme/gnome-terminal)
- Download a nerd font
- Set terminal font to the nerd font

### Neovim
- depends on Apt Package (make, cmake)
- clone neovim
- build and install neovim from source
- OR: download the tarball from github (deprecated)
- OR: use the appimage from github
- OR: could use `snap`, which is reasonably up-to-date
- Currenlty need to start neovim 3 times in order for everything to fully configure... this is not great

### Gnome tweaks
- `sudo apt install gnome-tweaks`
- Go into menu and tweak it 

### VSCode
- [Install VSCode](https://code.visualstudio.com/docs/setup/linux)
- Install Nord extenion
- Install all of my extensions - can I sync these via my dotfiles?

### Tmux
- Need to run `C-b I` to install my stuff from tpm

