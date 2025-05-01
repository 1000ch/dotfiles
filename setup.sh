#!/bin/sh

recreate_symlink() {
  if [ -L "$2" ]; then
    echo "Removing $2 to recreate a symlink"
    rm -f "$2"
  fi

  ln -sf "$1" "$2"
}

# This has to be executed inside dotfiles repository location
# `.zshenv` exports the same but it's not sure `.zshenv` is loaded
DOTREPO="$(cd $(dirname $0); pwd)"

# `zsh/.zshenv` will be specifically symlinked to $HOME/.zshenv
# This is to put `.zshenv` under $ZDOTDIR instead of $DOTREPO/home
recreate_symlink "$DOTREPO/zsh/.zshenv" "$HOME/.zshenv"

# These dotfiles will be symlinked to the same passes under the home directory
DOTFILES=(
  ".config/ghostty/config"
  ".config/starship.toml"
  ".editorconfig"
  ".gemrc"
  ".gitconfig"
  ".vimrc"
)

# Create a directory before symlinking
mkdir -p "$HOME/.config/ghostty"

for dotfile in "${DOTFILES[@]}" ; do
  recreate_symlink "$DOTREPO/home/$dotfile" "$HOME/$dotfile"
done
