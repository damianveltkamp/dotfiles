# 🧰 Dotfiles

Repository for all my dotfile configurations, and installation steps to get everything running on a new Mac OS machine.
Not advised to blindly copy paste from this repo, this is all for personal use, feel free to get inspired.

**_FYI: wiki is outdated and will not be updated._**

## Table of contents

- [Installing setup](#%EF%B8%8F-installing-the-setup)
- [Manual installation steps](#-manual-installation-steps)

## ⚙️ Installing the setup

Curl install script to get all packages, casks and fonts, also changes default shell to zsh:

```
curl -s https://raw.githubusercontent.com/damianveltkamp/dotfiles/master/install.sh
```

Clone this repository onto your machine:

```
git clone https://github.com/damianveltkamp/dotfiles.git ~/Documents/development/dotfiles
```

Create a config directory on your machine on your home path if you don't already have one

```
mkdir -p ~/.config
```

Make simlinks for all dotfiles and config files.

```
cd ~/Documents/development/dotfiles && stow --ignore ".DS_Store" -vt ~/ nvim pandoc bin alacritty git zsh tmux
```

Only thing left is open neovim and install packer packes.

```
:PackerCompile
```

```
:PackerInstall
```

## 🔧 Manual installation steps

- Set capslock key to escape key.
- Set alfred to launch with cmd space, remove spotlight to launch with cmd space.
- Set shiftit shortcuts.
- Install treesitter language parsers
  - typescript
  - tsx
  - javascript
  - css
  - scss
  - vim
  - lua
