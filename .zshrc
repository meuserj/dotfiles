#!/bin/zsh
source $HOME/.consolefont.sh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
if hash cygpath 2>/dev/null
then
    export PATH=$(cygpath $USERPROFILE)/AppData/Roaming/npm:$PATH
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.gitdotfiles/oh-my-zsh

if [[ -e /usr/libexec/java_home ]]
then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

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
plugins=(\
    bgnotify\
    common-aliases\
    compleat\
    copydir\
    copyfile\
    emoji\
    emoji-clock\
    extract\
    globalias\
    gnu-utils\
    jira\
    jsontools\
    jump\
    magic-enter\
    profiles\
    safe-paste\
    systemadmin\
    vi-mode\
    web-search\
)
if [[ -f /etc/os-release ]]
then
    source /etc/os-release
    if [[ $ID == "debian" ]]
    then
        plugins+=(debian)
    elif [[ $ID == "ubuntu" ]]
    then
        plugins+=(ubuntu)
    fi
fi
if command -v convert >/dev/null
then
    plugins+=(catimg)
fi
if command -v command-not-found >/dev/null
then
    plugins+=(command-not-found)
fi
if command -v direnv >/dev/null
then
    plugins+=(direnv)
fi
if [[ $(uname -s) == "Linux" ]]
then
    plugins+=(systemd)
fi
if [[ -f $HOME/.fzf ]]
then
    plugins+=(fzf)
fi
if command -v git >/dev/null
then
    plugins+=(git-extras gitfast gitignore)
fi
if [[ $(uname -s) == "Darwin" ]]
then
    plugins+=(iterm2 osx)
fi
if command -v mosh >/dev/null
then
    plugins+=(mosh)
fi
if command -v nmap >/dev/null
then
    plugins+=(nmap)
fi
if command -v node >/dev/null
then
    plugins+=(node npx npm)
fi
if command -v rg >/dev/null
then
    plugins+=(ripgrep)
fi
if command -v rsync >/dev/null
then
    plugins+=(rsync)
fi
if command -v thefuck >/dev/null
then
    plugins+=(thefuck)
fi
if command -v tmux >/dev/null
then
    plugins+=(tmux)
fi

DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh
if hash brew 2>/dev/null
then
    source $(brew --prefix)/etc/profile.d/z.sh
fi

unalias fd

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

if command -v vimpager >/dev/null
then
    export PAGER=$(which vimpager)
    alias less=$PAGER
    alias zless=$PAGER
fi
alias so=source
if [[ "$OSTYPE" == "darwin"* ]]
then
    alias clip="nc localhost 8377"
else
    alias clip="nc -N localhost 8377"
fi
if command -v nvim >/dev/null
then
    alias vim=nvim
    alias vi=nvim
    alias vimdiff='nvim -d'
    export EDITOR=nvim
else
    export EDITOR=vim
fi
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
    cat $HOME/.ssh/id_[rd]sa.pub | ssh $1 'mkdir -p ~/.ssh;cat - >> ~/.ssh/authorized_keys;chmod 700 ~/.ssh;chmod 600 ~/.ssh/authorized_keys' && ssh $1;
}

# setprompt
uname=$(uname)
if [ "$TERM" != "dumb" ]; then
    if [[ -e $HOME/.vim/plugged/gruvbox/ ]]
    then
        if [[ $LC_TERMINAL == "iTerm2" ]]
        then
            source $HOME/.vim/plugged/gruvbox/gruvbox_256palette_osx.sh
        else
            source $HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh
        fi
    fi
    source $HOME/.shellprompt.sh
    source $HOME/.gitdotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    if command -v lsd >/dev/null
    then
        alias ls='lsd'
    else
        if [ $uname == "Darwin" ]
        then
            alias ls='ls -G'
            alias dir='ls -G'
        else
            alias ls='ls --color=auto'
            alias dir='ls --color=auto'
        fi
    fi
fi

if [ $uname == CYGWIN_NT-6.3 ]
then
    PATH=$PATH:$(cygpath $APPDATA)/npm
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ -e $HOME/.perforce_env ]]
then
    source $HOME/.perforce_env
fi

