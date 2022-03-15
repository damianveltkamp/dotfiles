brew="/usr/local/bin/brew"

if [ -f "$brew" ]
then
  echo "Homebrew is installed, nothing to do here"
else
  echo "Homebrew is not installed, installing now"
  echo "This may take a while"
  echo "Homebrew requires osx command lines tools, please download xcode first"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

packages=(
"git"
"node"
"tmux"
"neovim"
"zsh"
"ripgrep"
"nvm"
"fzf"
"efm-langserver"
"fd"
"zplug"
"spaceship"
"efm-langserver"
"yarn"
"ninja"
)

casks=(
"spotify"
"alacritty"
"shiftit"
"slack"
"google-chrome"
"firefox"
"alfred"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

for i in "${casks[@]}"
do
  brew install --cask $i
  echo "---------------------------------------------------------"
done

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "---------------------------------------------------------"

# Install hack font
brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
echo "---------------------------------------------------------"

yarn global add typescript eslint_d prettier vim-language-server vscode-langservers-extracted yaml-language-server
echo "---------------------------------------------------------"

echo "Changing to zsh"
chsh -s $(which zsh)

echo "You'll need to log out for this to take effect"
echo "---------------------------------------------------------"

exit 0
