# Dotfiles

Repository for all my dotfile configurations.
This setup makes use of the Neovim nightly build 0.5 and is not compatible with versions below 0.5.
Installation guide is written towards Macos users and is only for installing my Neovim setup.

## Table of contents

- [Prerequisites](#prerequisites)
- [Installing prerequisites](#installing-prerequisites)
- [Installing the setup](#installing-the-setup)

## Prerequisites

- [Homebrew](https://brew.sh/)
- [Ripgrep](https://formulae.brew.sh/formula/ripgrep)
- [Node](https://nodejs.org/en/download/)
- [Nvm](https://formulae.brew.sh/formula/nvm)
- [Neovim](https://formulae.brew.sh/formula/neovim)
- [Git](https://formulae.brew.sh/formula/git)
- [Fzf](https://formulae.brew.sh/formula/fzf)
- [Efm languageserver](https://formulae.brew.sh/formula/efm-langserver)
- [Fd](https://formulae.brew.sh/formula/fd)

## Installing prerequisites

This installing section is written towards Macos users.

### Homebrew

Before you can start installing the other prerequisites you must first install Homebrew by typing the following
into your terminal:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Zsh

To change your default shell on Macos to zsh type the following command in the terminal.

```
chsh -s /bin/zsh
```

Enter your password when prompted. After doing this shutdown your terminal window and reopen it, you are now using Zsh as the default shell.

### Ripgrep

You can install Ripgrep by using homebrew.

```
brew install ripgrep
```

### Node

You can install Node from their [website](https://nodejs.org/en/download/), make sure you install the LTS version of node
if you want to have the most stable version.

### Nvm

You can install Nvm by using homebrew.

```
brew install nvm
```

### Neovim

This setup makes use of the new features in Neovim 0.5, this version is not officially released yet but we can install it with homebrew.
This setup will not work with Neovim versions below 0.5.

```
brew install neovim --head
```

### Git

You can install Git by using homebrew.

```
brew install neovim
```

### Fzf

You can install Fzf by using homebrew.

```
brew install fzf
```

### Efm-languageserver

You can install Efm-languageserver by using homebrew.

```
brew install efm-langserver
```

### Fd

You can install Fd by using homebrew.

```
brew install fd
```

## Installing the setup

Clone this repository onto your machine:

```
git clone https://github.com/damianveltkamp/dotfiles.git ~/
```

Create a config directory on your machine on your home path

```
mkdir -p ~/.config/nvim
```

Move my configuration files into your configuration directory:

```
mv $HOME/dotfiles/nvim $HOME/.config/nvim
```
