# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Path to the dotfiles repository
export DOTREPO=$(ghq root)/github.com/1000ch/dotfiles

# Indicate that this is a place for zsh config
# https://zsh.sourceforge.io/Doc/Release/Files.html
export ZDOTDIR=$DOTREPO/.zsh

# Indicate that this is a place for antigen
# https://github.com/zsh-users/antigen/wiki/Configuration
export ADOTDIR=$DOTREPO/.antigen
