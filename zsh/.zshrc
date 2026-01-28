# 1. ENVIRONMENT VARIABLES & PATHS
export HOMEBREW_PREFIX="/usr/local"
export PATH="./node_modules/.bin:$PATH"
export EDITOR=nvim
export NOTES_DIR="$HOME/Documents/development/2nd-brain"
export NODE_EXTRA_CA_CERTS="/etc/ssl/cert.pem"

export FZF_DEFAULT_OPTS="--extended"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

hash -d dev=~/Documents/development
hash -d notes=~/Documents/development/2nd-brain
hash -d nvim=~/.config/nvim
hash -d work=~/Documents/work

# TODO: check if it's worth to migrate over to antidote plugin manager.
# 2. ZPLUG (Plugin Management)
export ZPLUG_HOME=$HOMEBREW_PREFIX/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "jeffreytse/zsh-vi-mode"
zplug "Aloxaf/fzf-tab"

# 3. COMPLETIONS & ZSH SETTINGS
fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)

zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) 
bindkey -M menuselect '^[[Z' reverse-menu-complete


# 4. ALIASES
alias grep="rg"
alias n="nvim"
alias ll="ls -l"
alias luamake="/Users/damianveltamp/lua-language-server/3rd/luamake/luamake"
alias disableDesktop="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias enableDesktop="defaults write com.apple.finder CreateDesktop true; killall Finder"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#888888'

# 5. CUSTOM FUNCTIONS
export NVM_DIR="$HOME/.nvm"

# Define the loader function
_load_nvm() {
    # Hardcode the path to avoid $(brew --prefix)
    local nvm_path="$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
    [ -s "$nvm_path" ] && . "$nvm_path"
}

nvm()  { unset -f nvm node npm npx; _load_nvm; nvm "$@"; }
node() { unset -f nvm node npm npx; _load_nvm; node "$@"; }
npm()  { unset -f nvm node npm npx; _load_nvm; npm "$@"; }
npx()  { unset -f nvm node npm npx; _load_nvm; npx "$@"; }

# FZF Process Kill
kp() {
    local pid=$(ps -ef | sed 1d | fzf -m --header='[kill:process]' | awk '{print $2}')
    [ -n "$pid" ] && echo $pid | xargs kill -${1:-9}
}

# FZF Brew Install/Upgrade
bip() {
    local inst=$(brew search | fzf -m --header='[brew:install]')
    [ -n "$inst" ] && for prog in $(echo $inst); do brew install $prog; done
}

bup() {
    local upd=$(brew leaves | fzf -m --header='[brew:update]')
    [ -n "$upd" ] && for prog in $(echo $upd); do brew upgrade $prog; done
}

# FZF Git Checkout Branch (Improved)
gcb() {
    local branch=$(git branch -a | fzf | awk '{print $1}' | sed "s#remotes/[^/]*/##" | sed "s/\*//")
    [ -n "$branch" ] && git checkout "$branch"
}

# Rename files to lowercase
rfl() {
    for f in *; do mv "$f" "$f.tmp" && mv "$f.tmp" "${f:l}"; done
}

# Compare JSON object shapes and find missing keys
jq-diff-shape() {
  if [[ -z "$1" ]]; then
    echo "Usage: jq-diff-shape <file.json>"
    return 1
  fi

  jq '
    # 1. Map each object (directly from the input array)
    map({
      id: .id,
      paths: [path(.. | select(scalars)) | join(".")]
    }) as $objects
    | 
    # 2. Create a master list of all unique paths
    ([$objects[].paths[]] | unique) as $universal_paths
    | 
    # 3. Compare each object to the master list
    $objects 
    | map({
        id: .id,
        missing_keys: ($universal_paths - .paths)
      })
    | 
    # 4. Only show objects with discrepancies
    map(select(.missing_keys | length > 0))
  ' "$1"
}


# 6. TOOL INITIALIZATION & PLUGIN LOADING
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
    alias cd='z'
    alias cdd='z -'
fi


# LOAD PLUGINS
if ! zplug check --verbose; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# 7. VI MODE & KEYBINDINGS
export KEYTIMEOUT=1

function my_init_widgets() {
    # Directory Widgets 
    function _widget_dev() { BUFFER="builtin cd ~dev"; zle accept-line; }
    function _widget_work() { BUFFER="builtin cd ~work"; zle accept-line; }
    function _widget_notes() { BUFFER="builtin cd ~notes"; zle accept-line; }
    function _widget_nvim() { BUFFER="builtin cd ~nvim"; zle accept-line; }
    function _widget_home() { BUFFER="builtin cd ~"; zle accept-line; }
    function _widget_up() { BUFFER="builtin cd .."; zle accept-line; }

    # Register the widgets
    zle -N _widget_dev
    zle -N _widget_work
    zle -N _widget_notes
    zle -N _widget_nvim
    zle -N _widget_home
    zle -N _widget_up

    # Bind to both 'main' and 'viins' (Insert mode) to ensure they work while typing
    bindkey -M main "^p" _widget_dev
    bindkey -M main "^w" _widget_work
    bindkey -M main "^n" _widget_notes
    bindkey -M main "^v" _widget_nvim
    bindkey -M main "^h" _widget_home
    bindkey -M main "^k" _widget_up
    
    bindkey -M viins "^p" _widget_dev
    bindkey -M viins "^w" _widget_work
    bindkey -M viins "^n" _widget_notes
    bindkey -M viins "^v" _widget_nvim
    bindkey -M viins "^h" _widget_home
    bindkey -M viins "^k" _widget_up
}

# 8 Register widgets with the vi-mode plugin
zvm_after_init_commands+=(my_init_widgets)

# 9 LOAD THEME & STARSHIP
source ~/.config/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

# --- THE SINGLE COMPINIT CALL ---
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

eval "$(starship init zsh)"
