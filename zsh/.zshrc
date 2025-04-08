export PATH=./node_modules/.bin:$PATH
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh
source ~/.config/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh
export JAVA_HOME=$(/usr/libexec/java_home -v11)
export PATH="$HOME/.jenv/bin:$PATH"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "jeffreytse/zsh-vi-mode"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Aliases

alias n="nvim"
alias ll="ls -l"
alias luamake=/Users/damianveltamp/lua-language-server/3rd/luamake/luamake
alias disableDesktop="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias enableDesktop="defaults write com.apple.finder CreateDesktop true; killall Finder"

# Set default editor
export EDITOR=nvim

# Variables
export NOTES_DIR="$HOME/Documents/development/2nd-brain"
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# ~/.zshrc
autoload -Uz compinit
if [ "$(whoami)" = "YOUR_NON_ADMIN_USER" ]; then
  compinit -i
else
  compinit
fi

# symlink;
fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
  echo -ne "\e[6 q"
}

zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

# Custom cd
# chpwd() ll

# CD into development directory
function development_directory() {
  BUFFER="cd ~/Documents/development"
  zle accept-line
}

# CD into notes directory
function notes_directory() {
  BUFFER="cd ~/Documents/development/2nd-brain"
  zle accept-line
}

# CD into nvim config directory
function nvim_config_directory() {
  BUFFER="cd ~/.config/nvim"
  zle accept-line
}

# CD into home directory
function home_directory() {
  BUFFER="cd ~/."
  zle accept-line
}

# CD into personal development directory
function development_directory() {
  BUFFER="cd ~/Documents/development"
  zle accept-line
}

# CD up a directory
function up_widget() {
  BUFFER="cd .."
  zle accept-line
}

# CD into work directory
function work_directory() {
  BUFFER="cd ~/Documents/work"
  zle accept-line
}

function my_init() {
  zle -N development_directory
  bindkey "^p" development_directory

  zle -N work_directory
  bindkey "^w" work_directory

  zle -N notes_directory
  bindkey "^n" notes_directory

  zle -N nvim_config_directory
  bindkey "^v" nvim_config_directory

  zle -N home_directory
  bindkey "^h" home_directory

  zle -N home_directory
  bindkey "^d" home_directory

  zle -N up_widget
  bindkey "^k" up_widget
}
zvm_after_init_commands+=(my_init)

### PROCESS
# mnemonic: [K]ill [P]rocess
# show output of "ps -ef", use [tab] to select one or multiple entries
# press [enter] to kill selected processes and go back to the process list.
# or press [escape] to go back to the process list. Press [escape] twice to exit completely.
kp() {
  local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')
  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

bip() {
  ### BREW + FZF
  # update multiple packages at once
  # mnemonic [B]rew [U]pdate [P]lugin
  local inst=$(brew search | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[brew:install]'")

  if [[ $inst ]]; then
    for prog in $(echo $inst)
    do brew install $prog
    done
  fi
}

bup() {
  ### BREW + FZF
  # uninstall multiple packages at once, async
  # mnemonic [B]rew [C]lean [P]lugin (e.g. uninstall)

  local upd=$(brew leaves | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[brew:update]'")

  if [[ $upd ]]; then
    for prog in $(echo $upd)
    do brew upgrade $prog
    done
  fi

}

# Renames files to lower case for current directory
rfl() {
  for f in *; do mv "$f" "$f.tmp"; mv "$f.tmp" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done
}

# FZF ripgrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Basic auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# Line above enables dotfiles to be found
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Fzf and gitbranches implementation
gcb() {
  git checkout $(git branch -a | fzf| awk '{$1=$1};1')
}

# Fzf and gitbranches implementation
gfb() {
  git fetch $(git branch -a | fzf| awk '{$1=$1};1')
}

nvi() {
  nvm install node --reinstall-packages-from=node
}

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#888888'

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"

  alias cd='z'
  # Alias below is same as 'cd -', takes to the previous directory
  alias cdd='z -'
fi

eval "$(starship init zsh)"
eval "$(jenv init -)"
