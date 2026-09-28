#!/usr/bin/env bash

readonly DOTS="$HOME/.dotfiles"
readonly VSCODE_CONFIG="$HOME/Library/Application Support/Code/User"

# Ask for the administrator password upfront
sudo -v

echo "→ Installing Xcode Command Line Tools..."
xcode-select --install 2>/dev/null || true

# Install Homebrew
if ! command -v brew >/dev/null
then
  echo " → Installing Homebrew for package management..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update

echo "→ Installing packages, applications and fonts using Homebrew..."
brew bundle --file="$DOTS/Brewfile"

echo "→ Configuring Git..."
ln -sfn "$DOTS/git/.gitconfig" ~/.gitconfig
ln -sfn "$DOTS/git/.gitignore_global" ~/.gitignore_global
ln -sfn "$DOTS/git/.gitmessage" ~/.gitmessage

echo "→ Configuring GPG..."
mkdir -p ~/.gnupg
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf

echo "→ Installing Oh My ZSH and custom plugins..."
KEEP_ZSHRC=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mkdir -p ~/.custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.custom/plugins/zsh-syntax-highlighting

echo "→ Configuring ZSH..."
ln -sfn "$DOTS/zsh/.zshrc" ~/.zshrc
ln -sfn "$DOTS/zsh/.zprofile" ~/.zprofile

echo "→ Installing language versions with mise..."
mkdir -p ~/.config/mise
ln -sfn "$DOTS/mise/config.toml" ~/.config/mise/config.toml
mise install

echo "→ Installing npm packages..."
mise exec -- corepack enable
grep -v "#" "$DOTS/npm/globals" | xargs mise exec -- npm install -g

echo "→ Installing GitHub CLI extensions..."
gh extension install drogers0/gh-image

echo "→ Configuring VSCode..."
mkdir -p "$VSCODE_CONFIG"
rm -rf "$VSCODE_CONFIG/snippets" "$VSCODE_CONFIG/keybindings.json" "$VSCODE_CONFIG/settings.json"
ln -s "$DOTS/vscode/snippets" "$VSCODE_CONFIG/snippets"
ln -s "$DOTS/vscode/keybindings.json" "$VSCODE_CONFIG/keybindings.json"
ln -s "$DOTS/vscode/settings.json" "$VSCODE_CONFIG/settings.json"

# Set macOS defaults
echo "→ Set macOS defaults... (It'll shut down Terminal!)"
sh "$DOTS/macos.sh"
