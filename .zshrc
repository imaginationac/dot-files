# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="imaginationac"

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
plugins=(bundler git npm rbenv)

source $ZSH/oh-my-zsh.sh

# oh-my-zsh has ls aliases. Put them here after sourcing to prevent overriding.
alias l='ls --color=always --group-directories-first'
alias ll='l -l'
alias la='l -a'
alias lla='ll -a'

# Customize to your needs...
export MANWIDTH=80
export PATH=/home/dorian/.rbenv/bin:/home/dorian/local/bin:/home/dorian/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

eval "$(rbenv init - zsh)"
. /home/dorian/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
