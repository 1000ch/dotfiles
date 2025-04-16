#!/bin/sh
brew update
brew upgrade

BREW_LIBS=(
  "ag"
  "antigen"
  "oven-sh/bun/bun"
  "fzf"
  "git"
  "go"
  "hugo"
  "nodenv"
  "nodenv/nodenv/nodenv-package-rehash"
  "nodenv/nodenv/node-build-update-defs"
  "node-build"
  "pyenv"
  "rbenv"
  "ruby-build"
  "starship"
  "vim"
)

BREW_APPS=(
  "1password"
  "alfred"
  "alt-tab"
  "appcleaner"
  "contexts"
  "discord"
  "dropbox"
  "fork"
  "google-japanese-ime"
  "imageoptim"
  "popclip"
  "rectangle"
  "slack"
  "visual-studio-code"
)

for brew_lib in "${BREW_LIBS[@]}" ; do
  if brew info "$brew_lib" | grep -q "Not installed"; then
    brew install "$brew_lib"
  else
    echo "$brew_lib is already installed"
  fi
done

for brew_app in "${BREW_APPS[@]}" ; do
  if brew info "$brew_app" | grep -q "Not installed"; then
    brew install "$brew_app"
  else
    echo "$brew_app is already installed"
  fi
done

brew cleanup
