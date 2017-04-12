# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=""

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colored-man-pages git npm pip docker)

source $ZSH/oh-my-zsh.sh

# oh-my-zsh has ls aliases. Put them here after sourcing to prevent overriding.
alias l='ls -G'
alias ll='l -l'
alias la='l -a'
alias lla='ll -a'

# Customize to your needs...
export EDITOR=gvim
export MANWIDTH=80 #Man pages width set to 80 characters for easier scanning.
export PATH=/Users/dorianpatterson/Library/Python/2.7/bin:$PATH
export TERM=xterm-256color #256 colors in the terminal
export SHELL=/usr/local/bin/zsh

# rbenv init for zsh.
if [[ -d ~/.rbenv ]]; then
	eval "$(rbenv init - zsh)"
fi

# source powerline.zsh for prompt.
POWERLINE_PATH="/Users/dorianpatterson/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh"
if [[ -a $POWERLINE_PATH ]]; then
	. $POWERLINE_PATH
fi
