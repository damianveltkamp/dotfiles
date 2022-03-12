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
)

casks=(
"spotify"
"chrome"
"slack"
"alacritty"
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

echo "Changing to zsh"
chsh -s $(which zsh)

echo "You'll need to log out for this to take effect"
echo "---------------------------------------------------------"

exit 0
