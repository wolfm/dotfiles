# Initialize performance measurement
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Use NVM lazy-loading due to slow startup
export NVM_LAZY_LOAD=true

plugins=(
    git
    docker
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

# Initialize DDS if installed
sourceif ${NDDSHOME}/resource/scripts/rtisetenv_x64Linux4gcc7.3.0.zsh > /dev/null

# Lazyload ROS2 if installed
init_ros2() {
	sourceif /opt/ros2_connextdds/src/ros2/rmw_connextdds/install/setup.zsh
	sourceif /opt/ros/foxy/setup.zsh
}
lazyload ros2 init_ros2

# Measure performance
# zprof
