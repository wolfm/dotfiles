# Michael's .bashrc script

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Run common shell environment setup
source ~/.commonrc

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Use color prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Powerline config
# If installed through apt
if [ -f "/usr/share/powerline/bindings/bash/powerline.sh" ]; then
	export POWERLINE_BASE_DIR="/usr/share/powerline/"
else 
	PYTHON3_USER_SITE_PACKAGES_DIR=$(python3 -m site --user-site)
	if [ -f "${PYTHON3_USER_SITE_PACKAGES_DIR}/powerline/bindings/bash/powerline.sh" ]; then
		export POWERLINE_BASE_DIR="${PYTHON3_USER_SITE_PACKAGES_DIR}/powerline/"
	fi
fi
if [ ! -z $POWERLINE_BASE_DIR ]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	source "${POWERLINE_BASE_DIR}bindings/bash/powerline.sh"
fi

# enable programmable completion features (you don't need to enable
# this if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Initialize DDS if installed
sourceif ${NDDSHOME}/resource/scripts/rtisetenv_x64Linux4gcc7.3.0.bash > /dev/null

# Lazyload ROS2 if installed
init_ros2() {
  sourceif /opt/ros2_connextdds/src/ros2/rmw_connextdds/install/setup.bash
  sourceif /opt/ros/foxy/setup.bash
}
lazyload init_ros2 ros2 colcon rosdep
