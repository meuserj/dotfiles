#!/bin/zsh
source $HOME/.consolefont.sh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.gitdotfiles/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast git-extras common-aliases node npm osx vi-mode web-search)

source $ZSH/oh-my-zsh.sh
if hash brew 2>/dev/null
then
    source $(brew --prefix)/etc/profile.d/z.sh
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session && exit
    else
        tmux attach-session -t "$ID" && exit
    fi
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
DIRSTACKSIZE=8

setopt appendhistory autocd beep extendedglob notify autopushd pushdminus pushdsilent pushdtohome
unsetopt nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# puts the cursor at the end when going back in history
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

alias dh='dirs -v'
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

export PAGER=/usr/local/bin/vimpager
alias less=$PAGER
alias zless=$PAGER
alias so=source
alias clip="nc localhost 8377"
export EDITOR=$(which vim)
export PATH=$HOME/bin:$PATH
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

fpath=(/usr/local/share/zsh-completions $fpath)


function ssh-authorize
{
cat $HOME/.ssh/id_[rd]sa.pub | ssh $1 'mkdir -p ~/.ssh;cat - >> ~/.ssh/authorized_keys' && ssh $1;
}

# setprompt
uname=$(uname)
if [ "$TERM" != "dumb" ]; then
    source $HOME/.shellprompt.sh
    source $HOME/.gitdotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    if [ $uname == "Darwin" ]
    then
        alias ls='ls -G'
        alias dir='ls -G'
    else
        alias ls='ls --color=auto'
        alias dir='ls --color=auto'
    fi
fi

if [ $uname == CYGWIN_NT-6.3 ]
then
    PATH=$PATH:$(cygpath $APPDATA)/npm
fi


