brew="/opt/homebrew/bin/brew"

if [ -f "$brew" ]
then
  echo $brew
  echo "Homebrew is installed, nothing to do here"
else
  echo "Homebrew is not installed, installing now"
  echo "This may take a while"
  echo "Homebrew requires osx command lines tools, please download xcode first"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
"fd"
"zoxide"
"zplug"
"starship"
"yarn"
"ninja"
"koekeishiya/formulae/yabai"
"koekeishiya/formulae/skhd"
)

casks=(
"alacritty"
"slack"
"spotify"
"google-chrome"
"brave-browser"
"firefox"
"discord"
"postman"
"raycast"
"basictex"
"font-hack-nerd-font"
)

tmuxPlugins=(
"https://github.com/catppuccin/tmux"
"https://github.com/tmux-plugins/tmux-sensible"
"https://github.com/tmux-plugins/tmux-yank"
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

for i in "${tmuxPlugins[@]}"
do
  mkdir -p ~/.config/tmux/plugins

  if [[$i == "https://github.com/catppuccin/tmux"]]; then
    git clone -b v2.1.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin
  elif [[ $i == "https://github.com/tmux-plugins/tmux-sensible" ]]; then
    git clone https://github.com/tmux-plugins/tmux-sensible ~/.config/tmux/plugins/tmux-sensible
    elif [[ $i == "https://github.com/tmux-plugins/tmux-yank" ]]; then
      git clone https://github.com/tmux-plugins/tmux-yank ~/.config/tmux/plugins/tmux-yank
  fi

  echo "---------------------------------------------------------"
done


echo "Changing to zsh"
chsh -s $(which zsh)
echo "You'll need to log out for this to take effect"
echo "---------------------------------------------------------"

exit 0
