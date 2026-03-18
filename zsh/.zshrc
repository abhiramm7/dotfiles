# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Disable oh-my-zsh theme — Pure handles the prompt
ZSH_THEME=""

# History settings
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Plugins
plugins=(git macos vi-mode zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Pure prompt
fpath+=(/opt/homebrew/share/zsh/site-functions)
autoload -U promptinit; promptinit
prompt pure

# Syntax highlighting (must come after oh-my-zsh)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Editor
export EDITOR='vim'
export VISUAL='vim'

# Python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# Aliases
alias ll='ls -lAh'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias python='python3'
alias pip='pip3'
