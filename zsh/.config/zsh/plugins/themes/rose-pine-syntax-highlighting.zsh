# Rosé Pine Moon Theme (for zsh-syntax-highlighting)
# Paste this before: source /path/to/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# General
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6e6a86'

# Functions/Methods (Pine & Foam)
ZSH_HIGHLIGHT_STYLES[alias]='fg=#3e8fb0'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#3e8fb0'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#3e8fb0'
ZSH_HIGHLIGHT_STYLES[function]='fg=#3e8fb0'
ZSH_HIGHLIGHT_STYLES[command]='fg=#3e8fb0'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#3e8fb0,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#9ccfd8,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#9ccfd8'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#9ccfd8'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#c4a7e7'

# Built-ins & Keywords
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#95b1ac'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#95b1ac'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#3e8fb0'

# Punctuation & Delimiters (Love & Iris)
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#eb6f92'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#eb6f92'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#eb6f92'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#eb6f92'

# Strings (Gold)
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#f6c177'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#f6c177'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f6c177'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#eb6f92,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f6c177'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#eb6f92,bold'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#f6c177'

# Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#eb6f92,bold'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#e0def4'

# Paths & History
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#eb6f92,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#e0def4,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#eb6f92,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#e0def4,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#eb6f92,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#c4a7e7'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#c4a7e7'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#eb6f92,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[default]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#e0def4'
