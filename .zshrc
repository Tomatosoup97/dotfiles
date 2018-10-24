# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/mat/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git sudo ssh-agent)

source $ZSH/oh-my-zsh.sh

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
export SSH_KEY_PATH="~/.ssh/id_rsa"

export VISUAL="vim"
export EDITOR="vim"

zstyle :omz:plugins:ssh-agent identities id_rsa


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh
#

chpwd() ls

alias fm="pcmanfm"
alias CC="clipcopy"
alias sbl="subl"
alias t="tree"
alias open="xdg-open"
alias god_damn_remove="shred --zero --remove --verbose"
alias vi=vim
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage\|state\|time to"'
alias pycharm='pycharm.sh & disown'
alias bl='xbacklight'
alias bls='xbacklight -set'
alias bli='xbacklight -inc 10'
alias bld='xbacklight -dec 10'

# zsh competion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i


export VISUAL=vim
export EDITOR=vim

PROMPT='${ret_status} %{$fg[red]%}%~%{$reset_color%} $(git_prompt_info)'

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ~/.oh-my-zsh/z/z.sh


export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export MIMIKER_SRC_PATH="/home/mat/repos/mimiker"
source /usr/bin/virtualenvwrapper.sh

# export SSH_AUTH_SOCK=/var/run/user/1000/gnupg/S.gpg-agent.ssh

# ssh agent
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    # ssh-agent > ~/.ssh-agent-thing
# fi
# # if [[ "$SSH_AGENT_PID" == "" ]]; then
#     eval "$(<~/.ssh-agent-thing)"
# fi


# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH="/usr/local/share/chromedriver:$PATH"
# export PATH="/home/mat/.gem/ruby/2.4.0/bin:$PATH"
# export PATH="/home/mat/Programs/pycharm-2017.2.4/bin:/home/mat/Programs/clion-2017.2.3/bin:$PATH"
export PATH="/usr/local/pycharm-2018.2.3/bin:$PATH"
export PATH="/snap/bin:$PATH"

# opam configuration
test -r /home/mat/.opam/opam-init/init.zsh && . /home/mat/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
