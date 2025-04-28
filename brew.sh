#!/bin/sh
brew update
brew upgrade

BREW_TAPS=(
  "oven-sh/bun"
  "nodenv/nodenv"
)

BREW_LIBS=(
  "ag"
  "antigen"
  "oven-sh/bun/bun"
  "fzf"
  "ghq"
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
  "ghostty"
  "google-japanese-ime"
  "imageoptim"
  "popclip"
  "rectangle"
  "slack"
  "visual-studio-code"
)

for brew_tap in "${BREW_TAPS[@]}" ; do
  brew tap "$brew_tap"
done

installed_libs=()
installed_apps=()

for brew_lib in "${BREW_LIBS[@]}" ; do
  if brew info "$brew_lib" | grep -q "Not installed"; then
    brew install "$brew_lib"
  else
    installed_libs+=($brew_lib)
  fi
done

for brew_app in "${BREW_APPS[@]}" ; do
  if brew info "$brew_app" | grep -q "Not installed"; then
    brew install --cask "$brew_app"
  else
    installed_apps+=($brew_app)
  fi
done

echo "These libs are already installed: ${installed_libs[*]}"
echo "These apps are already installed: ${installed_apps[*]}"

brew cleanup
