#!/usr/bin/env bash

readonly DOTS="$HOME/.dotfiles"
readonly VSCODE_CONFIG="$HOME/Library/Application Support/Code/User"

# Ask for the administrator password upfront
sudo -v

# Install Homebrew
if test ! $(which brew)
then
  echo " → Installing Homebrew for package management..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade

echo "→ Installing packages using Homebrew..."
brew install $(cat brew/brewfile|grep -v "#")

echo "→ Configuring Git..."
ln -s "$DOTS/git/.gitconfig" ~/.gitconfig
ln -s "$DOTS/git/.gitignore_global" ~/.gitignore_global
ln -s "$DOTS/git/.gitmessage" ~/.gitmessage

echo "→ Configuring ZSH..."
echo '/bin/zsh' | sudo tee -a /etc/shells > /dev/null
chsh -s /bin/zsh
ln -s "$DOTS/zsh/.zshrc" ~/.zshrc

echo "→ Installing Oh My ZSH and custom plugins..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir -p ~/.custom/plugins ~/.custom/themes
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.custom/plugins/zsh-syntax-highlighting
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.custom/themes/spaceship-prompt --depth=1

echo "→ Configuring VSCode..."
rm -rf "$VSCODE_CONFIG/{keybindings.json,settings.json}"
ln -s "$DOTS/vscode/snippets" "$VSCODE_CONFIG/snippets"
ln -s "$DOTS/vscode/keybindings.json" "$VSCODE_CONFIG/keybindings.json"
ln -s "$DOTS/vscode/settings.json" "$VSCODE_CONFIG/settings.json"

echo "→ Installing n (Node Version Management)..."
curl -L https://git.io/n-install | bash
echo "→ Installing npm packages..."
npm install -g $(cat nmp/globals|grep -v "#")

# Set macOS defaults
echo "→ Set macOS defaults... (It'll shut down Terminal!)"
sh macos.sh
