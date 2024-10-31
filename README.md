# 🧰 Dotfiles

Repository for all my dotfile configurations, and installation steps to get everything running on a new Mac OS machine.
Not advised to blindly copy paste from this repo, this is all for personal use, feel free to get inspired.

## Table of contents

- [Installing setup](#%EF%B8%8F-installing-the-setup)
- [Manual installation steps](#-manual-installation-steps)

## ⚙️ Installing the setup

### Curl install script to get all packages, casks and fonts, also changes default shell to zsh

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/damianveltkamp/dotfiles/master/install.sh)"
```

### Clone this repository onto your machine

```bash
git clone https://github.com/damianveltkamp/dotfiles.git ~/Documents/development/dotfiles
```

### Create a config directory on your machine on your home path if you don't already have one

```bash
mkdir -p ~/.config
```

### Make simlinks for all dotfiles and config files

```bash
cd ~/Documents/development/dotfiles && stow --ignore ".DS_Store" -vt ~/ nvim pandoc bin alacritty git zsh tmux yabai skhd starship
```

### Start yabai, skhd

```bash
yabai --start-service
```

```bash
skhd --start-service
```

### Tmux plugins

#### Tmux sensible

```bash
mkdir -p ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tmux-sensible ~/.config/tmux/plugins/tmux-sensible
```

#### Catppuccin

```bash
git clone -b v2.1.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin
```

#### Tmux yank

```bash
git clone https://github.com/tmux-plugins/tmux-yank ~/.config/tmux/plugins/tmux-yank
```

### Setup catppuccin themeing

#### Zsh syntax highlighting

```bash
mkdir -p ~/.config/zsh/plugins
cd ~/.config/zsh/plugins
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
cp -v catppuccin_macchiato-zsh-syntax-highlighting.zsh ~/.config/zsh/
```

### Pandoc

#### Install glossaries for pandoc by running

```bash
sudo tlmgr install glossaries
```

#### Clone citation styles

```bash
git clone https://github.com/citation-style-language/styles.git ~/.config/pandoc-citation-styles
```

## 🔧 Manual installation steps

- Set capslock key to escape key.
- Set keyboard input source to Dutch
- Remove Mac input sources shortcuts.
  - [C-Space overrides by input sources shortcut](https://github.com/tmux/tmux/issues/457)
- Set raycast to launch with cmd space, remove spotlight to launch with cmd space.
- Install XCode developer tools
