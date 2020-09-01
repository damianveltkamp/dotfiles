  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship

  export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

  # VARIABLES
  export NOTES_DIR="$HOME/documents/notes"

  # Custom cd
  chpwd() ls

  # CD into development directory
  function development_directory() {
    BUFFER="cd ~/documents/development"
    zle accept-line
  }
  zle -N development_directory
  bindkey "^p" development_directory

	# CD up a directory
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^k" up_widget

  # git
	function git_prepare() {
		if [ -n "$BUFFER" ];
			then
				BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ];
			then
				BUFFER="git add -A && git commit -v && git push"
		fi

		zle accept-line
	}
	zle -N git_prepare
	bindkey "^g" git_prepare

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

	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=160'

	source /Users/damianveltkamp/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias laptop='bash <(curl -s https://raw.githubusercontent.com/monfresh/laptop/master/laptop)'

export PATH="$HOME/.bin:$PATH"

eval "$(hub alias -s)"

source /usr/local/share/chruby/chruby.sh

source /usr/local/share/chruby/auto.sh

chruby ruby-2.7.1
[ -f /Users/damianveltkamp/.config/cani/completions/_cani.zsh ] && source /Users/damianveltkamp/.config/cani/completions/_cani.zsh
