#!/usr/bin/env bash
set -e

# Install dependencies
sudo apt update
sudo apt install -y zsh git curl

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Copy .zshrc
curl -fsSL https://raw.githubusercontent.com/bogdantrinc/shell/main/.zshrc -o "$HOME/.zshrc"

# Change login shell to zsh
chsh -s "$(which zsh)"

# Configure Git
git config --global core.editor "code --wait"
git config --global core.pager cat
git config --global pull.rebase false

echo "Successfully set up Shell"
