# Michael's .bashrc script

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Aliases
alias activate="source env/bin/activate"
alias agent="eval $(ssh-agent)"
alias git2="git add -A && git commit"
alias git3="git add -A && git commit && git push"
alias ll="ls -AlF"
alias la='ls -a'
alias l="ls -l"
alias diff="diff --color"

# Functions
mkdire() {
    mkdir $1 && cd $_
}

# Initialize pyenv if installed
if [ -x "$HOME/.pyenv/bin/pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1 # Needed for pyenv 2.0.7
fi

# If npm installed, set npm global module install location to ~/.npm
# User doesn't have access to usr/bin/lib/..., the default location
if which npm &> /dev/null ; then
    npm set prefix ~/.npm
    PATH="$HOME/.npm/bin:$PATH"
    PATH="./node_modules/.bin:$PATH"
fi

# Make vim default editor
export EDITOR=vim

# Strat ssh agent
eval $(ssh-agent &> /dev/null)

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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


# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Enable gcc colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Platform-specific .bashrc commands
# WSL
if [[ -n "$WSL_DISTRO_NAME" || -n "$IS_WSL" ]]; then
    source "$HOME/.platforms/wsl"
# iSH (on iOS)
elif [[ "$(uname -r)" == *-ish ]]; then
	source "$HOME/.platforms/ish"
fi

# Initialize environment for Rust if installed
if [ -f "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi
