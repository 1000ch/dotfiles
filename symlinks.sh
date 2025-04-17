#!/bin/sh
REPO="$(cd $(dirname $0); pwd)"
DOTFILES=(
  ".zshrc"
  ".zprofile"
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
    echo "A symlink exists, removing $HOME/$dotfile"
    rm -f "$HOME/$dotfile"
  fi

  ln -sf "$REPO/$dotfile" "$HOME/$dotfile"
done
