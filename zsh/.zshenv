# `ghq.root` is specified at home/.gitconfig symlinked to $HOME/.gitconfig
# Needs to eval because `ghq.root` includes alias/variables
GHQ_ROOT=$(eval echo $(git config --global ghq.root))

# Export a path to the dotfiles repository
export DOTREPO=$GHQ_ROOT/github.com/1000ch/dotfiles

# Indicate that this is a place for zsh config
# https://zsh.sourceforge.io/Doc/Release/Files.html
export ZDOTDIR=$DOTREPO/zsh

# Indicate that this is a place for zim
# https://github.com/zimfw/zimfw?tab=readme-ov-file#set-up-zshrc
export ZIM_HOME=$ZDOTDIR/.zim
export ZIM_CONFIG_FILE=$ZDOTDIR/.zimrc
