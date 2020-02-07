  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship

  # Custom cd
  chpwd() ls

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

	# FZF ripgrep
  	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
	export FZF_DEFAULT_OPS="--extended"
	# Setting fd as the default source for fzf
	export FZF_DEFAULT_COMMAND='fd --type f'

	# To apply the command to CTRL-T as well
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

	source /Users/damianveltkamp/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
