#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshenv from $HOME (if it exists) and symlinks the .zshenv file from the .dotfiles
rm -rf $HOME/.zshenv
ln -s $HOME/.dotfiles/.zshenv $HOME/.zshenv

# Homebrew
ln -s $HOME/.dotfiles/Brewfile $HOME/Brewfile
brew bundle install

# Fast node manager (https://github.com/Schniz/fnm)
fnm completions --shell zsh
fnm install --latest
fnm default --latest

# Rust (https://www.rust-lang.org/tools/install)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Is this the right place to install oh-my-zsh custom plugins?
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions  $ZSH/custom/plugins/zsh-autosuggestions
git clone https://github.com/chrisands/zsh-yarn-completions $ZSH/custom/plugins/zsh-yarn-completions
