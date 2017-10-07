# Start tmux
#if [ "$TMUX" = "" ]; then tmux new-session -A -s main; fi

# Path to your oh-my-zsh installation.
ZSH=/home/lukasz/.oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gitster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

HISTFILE=~/.zhistory

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(debian docker git colored-man-pages colorize command-not-found gradle mvn tmux)

# User configuration

# Enables tmux on every zsh login
zstyle ':omz:module:tmux' auto-start 'yes'

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
export EDITOR="vim"
export VISUAL="mousepad"
export BROWSER="google-chrome"
export TERMINAL="gnome-terminal"

# ssh-agent autostart
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export JAVA_HOME=/usr/lib/jvm/default-java

export M2_HOME=/usr/share/maven
export M2=$M2_HOME/bin

# Enable 256 color mode
export TERM=xterm-256color

# You may need to manually set your language environment
export LANG=en_IE.UTF-8

# Enforce in Qt5 GTK+ style usage
export QT_STYLE_OVERRIDE=GTK

# To run #cores + 1 compiling jobs concurrently
export MAKEFLAGS="-j$(expr $(nproc) \+ 1)"

# Custom key bindings
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

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

# Keyboard layout
setxkbmap pl

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

source $HOME/.aliases
source $HOME/.aliases_remote

# oh-my-zsh cache
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/lukasz/.sdkman"
[[ -s "/home/lukasz/.sdkman/bin/sdkman-init.sh" ]] && source "/home/lukasz/.sdkman/bin/sdkman-init.sh"

# tabtab source for jhipster package
# uninstall by removing these lines or running `tabtab uninstall jhipster`
[[ -f /home/lukasz/.config/yarn/global/node_modules/generator-jhipster/node_modules/tabtab/.completions/jhipster.zsh ]] && . /home/lukasz/.config/yarn/global/node_modules/generator-jhipster/node_modules/tabtab/.completions/jhipster.zsh
