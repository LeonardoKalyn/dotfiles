# path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export DEV="$HOME/Projects"
export DOTFILES="$HOME/.dotfiles"
export DOTFILES_BIN="$DOTFILES/bin"
export DOTFILES_ZSH="$DOTFILES/zsh"
export DOTFILES_GIT="$DOTFILES/git"

# ZSH configuration
ZSH_THEME="spaceship"
ZSH_CUSTOM="$HOME/.custom"

plugins=(
  docker                    # docker autocompletion
  gitfast                   # git faster autocompletion
  npm                       # npm autocompletion
  yarn                      # yarn autocompletion
  zsh-syntax-highlighting   # syntax highlighting for zsh
  brew
  git
  github
  colorize
  osx
)

# files
source $ZSH/oh-my-zsh.sh

# zsh & oh-my-zsh
alias reload=". $HOME/.zshrc"
alias r="reload"
alias zshconfig="code ~/.zshrc"

# docker
alias dc="docker"
alias dcc="docker-compose"

# git
alias gda="git branch | grep -v -E 'master' | xargs git branch -D"
alias gfc="git fetch && git checkout"

# directories
alias dev="cd $DEV"
alias desktop="cd $DESKTOP"
alias downloads="cd $DOWNLOADS"
alias dots="cd $DOTFILES"

#  create-react-app
alias cra="npx create-react-app"

# SSH Key
alias getssh="pbcopy < ~/.ssh/id_rsa.pub"
