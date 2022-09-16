# Initialize performance measurement
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Use NVM lazy-loading due to slow startup
export NVM_LAZY_LOAD=true

plugins=(
    git
    zsh-nvm
)

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

# Initialize ROS 2
source /opt/ros/foxy/setup.zsh

# NVM default
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ========= ROS AND RTI INITS =========== #
# DDS variables
export NDDSHOME=/opt/rti_connext_dds-6.1.0/
export RTI_LICENSE_FILE=${NDDSHOME}/rti_license.dat
source ${NDDSHOME}/resource/scripts/rtisetenv_x64Linux4gcc7.3.0.zsh > /dev/null
export ROS_DOMAIN_ID=100
export dds_domain=$ROS_DOMAIN_ID
# rmw_connext variables
export CONNEXTDDS_DIR=${NDDSHOME}
source /opt/ros2_connextdds/src/ros2/rmw_connextdds/install/setup.zsh
export RMW_IMPLEMENTATION=rmw_connextdds
# ROS variables
source /opt/ros/foxy/setup.zsh
# ==================== #

# Measure performance
# zprof
