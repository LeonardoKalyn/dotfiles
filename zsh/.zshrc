# path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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

# config
export DOTFILES="$HOME/.dotfiles"
export DOTFILES_BIN="$DOTFILES/bin"
export DOTFILES_ZSH="$DOTFILES/zsh"
export DOTFILES_GIT="$DOTFILES/git"

# files
source $ZSH/oh-my-zsh.sh
