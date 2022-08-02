# OH_MY_ZSH config

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# PERSONAL CONFIG

source ~/.commonrc

# Reconfigure option-arrow key for prev/next word
# # Necessary for kitty on Mac
if [[ "$(uname -s)" == Darwin ]]; then
	# Change to emacs binding format
	bindkey -e 

	# option-arrowkey
	bindkey '^[[1;9C' forward-word
	bindkey '^[[1;9D' backward-word

	# control-arrowkey
	# bindkey '\e\e[C' forward-word
	# bindkey '\e\e[D' backward-word
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
# 	eval "$__conda_setup"
# else
# 	if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
# 		. "/opt/anaconda3/etc/profile.d/conda.sh"
# 	else
# 		export PATH="/opt/anaconda3/bin:$PATH"
# 	fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
