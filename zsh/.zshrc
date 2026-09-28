# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export DEV="$HOME/Projects"
export DOTFILES="$HOME/.dotfiles"
export DOTFILES_ZSH="$DOTFILES/zsh"
export DOTFILES_GIT="$DOTFILES/git"

# ZSH configuration
source "$(brew --prefix)/opt/spaceship/spaceship.zsh"
ZSH_CUSTOM="$HOME/.custom"

plugins=(
  docker                    # docker autocompletion
  gitfast                   # git faster autocompletion
  npm                       # npm autocompletion
  yarn                      # yarn autocompletion
  zsh-syntax-highlighting   # syntax highlighting for zsh
  brew
  git
  gh
  mise
  colorize
  macos
)

# files
source $ZSH/oh-my-zsh.sh

# zsh & oh-my-zsh
alias reload="source $HOME/.zshrc"
alias r="reload"
alias zshconfig="cursor ~/.zshrc"
alias zshenv="cursor ~/.zshenv"

# docker
alias dc="docker"
alias dcc="docker-compose"

# git
alias gda="git branch | grep -v -E 'master|dev|main|develop|staging' | xargs git branch -D"
alias gfc="git fetch && git checkout"
export GPG_TTY=$(tty)

# directories
alias dev="cd $DEV"
alias desktop="cd $DESKTOP"
alias downloads="cd $DOWNLOADS"
alias dots="cd $DOTFILES"

# SSH Key
alias getssh="pbcopy < ~/.ssh/id_rsa.pub"

# Language versions (Erlang, Elixir, Node, Ruby, Go, Python) from .tool-versions / mise.toml
eval "$(mise activate zsh)"

eval "$(direnv hook zsh)"

# Google Cloud SDK
GCLOUD_SDK="$(brew --prefix)/share/google-cloud-sdk"
[[ -f "$GCLOUD_SDK/path.zsh.inc" ]] && source "$GCLOUD_SDK/path.zsh.inc"
[[ -f "$GCLOUD_SDK/completion.zsh.inc" ]] && source "$GCLOUD_SDK/completion.zsh.inc"

export PATH="$(brew --prefix)/opt/postgresql@17/bin:$PATH"

# Claude Code
export PATH="$HOME/.local/bin:$PATH"
