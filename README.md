# Dotfiles

Repository for all my dotfile configurations, and installation steps to get everything running on a new machine.

## Table of contents

- [Prerequisites](#prerequisites)
- [Installing prerequisites](#installing-prerequisites)
- [Installing the setup](#installing-the-setup)

## Prerequisites

- [Efm languageserver](https://formulae.brew.sh/formula/efm-langserver)
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

### Git repos

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

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

Making a simlink into ~/.config for nvim setup

```
stow --ignore ".DS_Store" -vt ~/ nvim pandoc bin alacritty git zsh tmux
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
