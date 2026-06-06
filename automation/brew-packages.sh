packages=(
"stow"
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
"ninja"
"silicon"
"koekeishiya/formulae/yabai"
"koekeishiya/formulae/skhd"
"jq"
"supabase"
)

echo "Installing all brew packages"
for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done
