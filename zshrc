# Initialize performance measurement
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Setting for oh-my-zsh
DISABLE_UPDATE_PROMPT=true

ZSH_THEME="robbyrussell"

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
	sourceif /opt/stargate/ext/ros2_connextdds/install/setup.zsh
	sourceif /opt/ros/humble/setup.zsh
}
lazyload init_ros2 ros2 colcon rosdep

# Measure performance
# zprof
