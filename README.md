# Dotfiles

Repository for all my dotfile configurations, and installation steps to get everything running on a new machine.
Not advised to blindly copy paste from this repo, this is all for personal use, feel free to get inspired.

## Table of contents

- [Installing the setup](#installing-the-setup)

## Installing the setup

Curl install script to get all packages and casks and fonts:

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

Now the only thing left to do should be installing all packages with packer.
To do this open up nvim by typing nvim in the terminal, after it opened type the following commands
in command mode.

```
:PackerCompile
```

```
:PackerInstall
```
