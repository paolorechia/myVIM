# If you come from bash you might have to change your $PATH.

# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="/home/paolo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias postman=/opt/postman/Postman/Postman

export PATH="/home/paolo/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias unityhub=/home/paolo/UnityHub/UnityHub.AppImage
source /home/paolo/dev/ebot7/bin/ebot7zshrc.sh

export DISABLE_AUTO_TITLE="true"
alias trello=/home/paolo/trello-cli/node_modules/trello-cli/bin/trello


alias trls='trello show-cards -b Todo'
alias trlstodo='trello show-cards -b Todo -l Todo'
alias trlsdone='trello show-cards -b Todo -l done'
alias trlsdoing='trello show-cards -b Todo -l doing'
alias trlspast='trello show-cards -b Todo -l donePast'

function tradd {
  trello add-card -b Todo -l Todo "$1"
}


function trstart {
  trello delete-card "$1" -b Todo -l Todo
  trello add-card "$1" -b Todo -l Doing
}

function trdone {
  # Deletes then add because move does not work
  trello delete-card "$1" -b Todo -l Doing
  trello add-card "$1" -b Todo -l Done
}

function trdel {
  trello delete-card "$1" -b Todo -l $2
}

function trmovetopast {
  trello move-all-cards -b todo -c todo -l done -d donePast
}

function weather {
  curl wttr.in
}

alias gitrs='git restore --staged '

function watcheslint {
  while true; do inotifywait -r -e close_write $1;
    clear && echo "ESLINT:" && npx eslint $1;
  done
}

function watchmocha {
  while true; do inotifywait -r -e close_write $1;
    clear && echo "MOCHA:" && npm run test;
  done
}

function watchpylint {
  while true; 
    do inotifywait -e -r close_write $1; 
    clear && echo "PYLINT:" && pylint $1 && echo "";
  done
}

function watchflake8 {
  while true; 
    do inotifywait -e -r close_write $1; 
    clear && echo "Flake8:" && flake8 $1 && echo "";
  done
}

function watchpylinters {
  while true; 
    do inotifywait -e -r close_write $1; 
    clear && echo "PYLINT:" && pylint $1 && echo "";
    echo "Flake8:" && flake8 $1 && echo "";
  done
}
