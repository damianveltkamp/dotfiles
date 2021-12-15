# Dotfiles

Repository for all my dotfile configurations.
This setup makes use of the Neovim nightly build 0.5 and is not compatible with versions below 0.5.
Installation guide is written towards Macos users and is only for installing my Neovim setup.

I do not advise on installing my exact settings, in the long run you want to be able to maintain your own.
But feel free to use these as a inspiration when creating your own setup.

If you do end up deciding to install these configs I have a installation guide below.

For the complete [documentation](https://github.com/damianveltkamp/dotfiles/wiki) check the wiki

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
- [Typescript](https://www.npmjs.com/package/typescript)
- [Eslint_d](https://www.npmjs.com/package/eslint_d)
- [Prettier](https://prettier.io/docs/en/install.html)
- [Vim languageserver](https://github.com/iamcco/vim-language-server)
- [Html languageserver](https://github.com/vscode-langservers/vscode-html-languageserver-bin)
- [Css languageserver](https://github.com/vscode-langservers/vscode-css-languageserver-bin)
- [Yaml languageserver](https://github.com/redhat-developer/yaml-language-server)
- [Json languageserver](https://github.com/vscode-langservers/vscode-json-languageserver)

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

Install command:

```
brew install ripgrep
```

### Node

You can install Node from their [website](https://nodejs.org/en/download/), make sure you install the LTS version of node
if you want to have the most stable version.

### Nvm

Install command:

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

Install command

```
brew install neovim
```

### Fzf

Install command

```
brew install fzf
```

### Efm-languageserver

Install command:

```
brew install efm-langserver
```

### Fd

Install command:

```
brew install fd
```

### NPM packages

Install command:

```
npm install -g typescript eslint_d prettier vim-language-server vscode-langservers-extracted yaml-language-server
```

## Installing the setup

THIS IS WIP (Currently working on implementing Gnu stow for creation of symlinks)

Clone this repository onto your machine:

```
git clone https://github.com/damianveltkamp/dotfiles.git ~/damian-dotfiles
```

Create a config directory on your machine on your home path if you don't already have one

```
mkdir -p ~/.config
```

Making a simlink into ~/.config for nvim setup

```
stow --ignore ".DS_Store" -vt ~/ nvim
```

Now the only thing left to do should be installing all packages with packer by.
To do this open up nvim by typing nvim in the terminal, after it opened type the following commands
in command mode.

```
:PackerCompile
```

```
:PackerInstall
```
