for file in $HOME/.{aliases,functions,variables}; do
  [ -r "$file" ] && source "$file"
done

if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# lang
export LANG=ja_JP.UTF-8

# show japanese files
setopt print_eight_bit

# set comment as #
setopt interactive_comments

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# nodenv
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
eval "$(nodenv init -)"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
export FPATH=~/.rbenv/completions:"$FPATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# gopath
export GOPATH="$HOME/.go"
export PATH=$PATH:$GOPATH/bin

# GPG
export GPG_TTY=$TTY

autoload -U compinit
compinit
