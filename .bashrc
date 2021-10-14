# Michael Wolf's .bashrc script

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# aliases
alias activate="source env/bin/activate"
alias agent="eval $(ssh-agent)"
alias git2="git add -A && git commit"
alias git3="git add -A && git commit && git push"
alias ll="ls -AlF"
alias la='ls -a'
alias l="ls -l"

# functions
mkdire() {
    mkdir $1 && cd $_
}

# initialize pyenv if installed
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

# make vim default editor
export EDITOR=vim

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable gcc colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Platform-specific .bashrc commands
if [[ -n "$WSL_DISTRO_NAME" || -n "$IS_WSL" ]]; then
    source "$HOME/.bash_platforms/.wsl"
fi