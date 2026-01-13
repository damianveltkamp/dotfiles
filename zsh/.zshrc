# 1. ENVIRONMENT VARIABLES & PATHS
export PATH="./node_modules/.bin:$PATH"
export EDITOR=nvim
export NOTES_DIR="$HOME/Documents/development/2nd-brain"
export NODE_EXTRA_CA_CERTS="/etc/ssl/cert.pem"

# FZF Configuration (Fixed typo from OPS to OPTS)
export FZF_DEFAULT_OPTS="--extended"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Named Directories (mnemonic: cd ~dev, cd ~work, etc.)
hash -d dev=~/Documents/development
hash -d notes=~/Documents/development/2nd-brain
hash -d nvim=~/.config/nvim
hash -d work=~/Documents/work

# 2. ZPLUG (Plugin Management)
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "jeffreytse/zsh-vi-mode"

# Load theme for syntax highlighting
[[ -f ~/.config/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh ]] && \
    source ~/.config/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

if ! zplug check --verbose; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# 3. COMPLETIONS & ZSH SETTINGS
fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)

autoload -Uz compinit
# Faster compinit: only regenerate dump file once a day
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) # Enable hidden files in completion
bindkey -M menuselect '^[[Z' reverse-menu-complete

# 4. VI MODE & KEYBINDINGS
export KEYTIMEOUT=1
# Note: Cursor shape is handled automatically by jeffreytse/zsh-vi-mode

function my_init_widgets() {
    # Directory Widgets
    function _widget_dev() { BUFFER="cd ~dev"; zle accept-line; }
    function _widget_work() { BUFFER="cd ~work"; zle accept-line; }
    function _widget_notes() { BUFFER="cd ~notes"; zle accept-line; }
    function _widget_nvim() { BUFFER="cd ~nvim"; zle accept-line; }
    function _widget_home() { BUFFER="cd ~"; zle accept-line; }
    function _widget_up() { BUFFER="cd .."; zle accept-line; }

    zle -N _widget_dev;   bindkey "^p" _widget_dev
    zle -N _widget_work;  bindkey "^w" _widget_work
    zle -N _widget_notes; bindkey "^n" _widget_notes
    zle -N _widget_nvim;  bindkey "^v" _widget_nvim
    zle -N _widget_home;  bindkey "^h" _widget_home
    zle -N _widget_up;    bindkey "^k" _widget_up
}
# Register widgets with the vi-mode plugin
zvm_after_init_commands+=(my_init_widgets)

# 5. ALIASES
alias grep="rg"
alias n="nvim"
alias ll="ls -l"
alias luamake="/Users/damianveltamp/lua-language-server/3rd/luamake/luamake"
alias disableDesktop="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias enableDesktop="defaults write com.apple.finder CreateDesktop true; killall Finder"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#888888'

# 6. CUSTOM FUNCTIONS
# Lazy load NVM (Prevents slow shell startup)
export NVM_DIR="$HOME/.nvm"
function nvm() {
    unset -f nvm node npm npx
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
    nvm "$@"
}
function node() { nvm > /dev/null && node "$@" }
function npm() { nvm > /dev/null && npm "$@" }
function npx() { nvm > /dev/null && npx "$@" }

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

# 7. TOOL INITIALIZATION (Always at the end)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
    alias cd='z'
    alias cdd='z -'
fi

eval "$(starship init zsh)"
