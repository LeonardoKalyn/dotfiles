# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export PATH=$N_PREFIX/bin:$PATH

export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export DEV="$HOME/Projects"
export DOTFILES="$HOME/.dotfiles"
export DOTFILES_BIN="$DOTFILES/bin"
export DOTFILES_ZSH="$DOTFILES/zsh"
export DOTFILES_GIT="$DOTFILES/git"

# JAVA and ANDROID
# export JAVA_HOME=$(/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home)

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
# export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# ZSH configuration
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
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
  macos
  python
  pip
)

# files
source $ZSH/oh-my-zsh.sh

# zsh & oh-my-zsh
alias reload="source $HOME/.zshrc"
alias r="reload"
alias zshconfig="code ~/.zshrc"

# docker
alias dc="docker"
alias dcc="docker-compose"

# git
alias gda="git branch | grep -v -E 'master|dev|main|develop' | xargs git branch -D"
alias gfc="git fetch && git checkout"

# directories
alias dev="cd $DEV"
alias desktop="cd $DESKTOP"
alias downloads="cd $DOWNLOADS"
alias dots="cd $DOTFILES"

#  create-react-app
alias cra="npx create-react-app"

#  fix react-native debugger
alias fix-rnd='echo "brew uninstall --cask react-native-debugger \n then delete ~/Library/Application Support/React Native Debugger"'

# SSH Key
alias getssh="pbcopy < ~/.ssh/id_rsa.pub"

# Ruby Management
eval "$(rbenv init - zsh)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
