casks=(
"ghostty"
"slack"
"spotify"
"google-chrome"
"brave-browser"
"firefox"
"discord"
"postman"
"raycast"
"whatsapp"
"basictex"
"font-hack-nerd-font"
)

echo "Installing all brew casks"
for i in "${casks[@]}"
do
  brew install --cask $i
  echo "---------------------------------------------------------"
done
