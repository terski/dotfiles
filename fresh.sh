#!/bin/sh

set -e

echo "Setting up your Mac..."

# /usr/bin/git is a stub until the Command Line Tools exist. That install
# opens a dialog and returns immediately, so stop and let them re-run.
if ! git --version >/dev/null 2>&1; then
  echo "Install the Xcode Command Line Tools, then run this script again:"
  echo "  xcode-select --install"
  exit 1
fi

# Removes .zshenv from $HOME (if it exists) and symlinks the .zshenv file from the .dotfiles
rm -rf "$HOME/.zshenv"
ln -s "$HOME/.dotfiles/zsh/.zshenv" "$HOME/.zshenv"

# Oh My Zsh is loaded from $ZDOTDIR/.oh-my-zsh, not ~/.oh-my-zsh.
# Keep ZDOTDIR unset here so the installer does not rewrite this repo's .zshrc.
ZSH="$HOME/.dotfiles/zsh/.oh-my-zsh"
if [ ! -d "$ZSH" ]; then
  ZSH="$ZSH" RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" "" --unattended --keep-zshrc
fi

# Check for Homebrew and install if we don't have it
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Homebrew
ln -sfn "$HOME/.dotfiles/Brewfile" "$HOME/Brewfile"
brew bundle --file="$HOME/.dotfiles/Brewfile" install

# Fast node manager (https://github.com/Schniz/fnm)
fnm install --latest
fnm default --latest

# Rust (https://www.rust-lang.org/tools/install)
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Custom plugins. Oh My Zsh loads these from $ZSH/custom/plugins.
plugins="$ZSH/custom/plugins"
mkdir -p "$plugins"

if [ ! -d "$plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$plugins/zsh-syntax-highlighting"
fi
if [ ! -d "$plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$plugins/zsh-autosuggestions"
fi
