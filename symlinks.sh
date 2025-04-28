#!/bin/sh
REPO="$(cd $(dirname $0); pwd)"
DOTFILES=(
  ".zshenv"
  ".aliases"
  ".functions"
  ".gemrc"
  ".vimrc"
  ".gitconfig"
  ".editorconfig"
  ".config/ghostty/config"
)

mkdir -p "$HOME/.config/ghostty"

for dotfile in "${DOTFILES[@]}" ; do
  if [ -L "$HOME/$dotfile" ]; then
    echo "Removing $HOME/$dotfile to recreate a symlink"
    rm -f "$HOME/$dotfile"
  fi

  ln -sf "$REPO/$dotfile" "$HOME/$dotfile"
done
