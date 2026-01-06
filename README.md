# 🧰 Dotfiles

Repository for all my dotfile configurations, and installation steps to get everything running on a new Mac OS machine.
Not advised to blindly copy paste from this repo, this is all for personal use, feel free to get inspired.

## Table of contents

- [Prerequisites](#prerequisites)
- [Installing setup](#%EF%B8%8F-installing-the-setup)
- [Manual installation steps](#-manual-installation-steps)

## Prerequisites

- Install XCode developer tools

## ⚙️ Installing the setup

### Curl install script to get all packages, casks and fonts, also changes default shell to zsh

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/damianveltkamp/dotfiles/master/install.sh)"
```

### Start yabai, skhd

```bash
yabai --start-service
```

```bash
skhd --start-service
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
