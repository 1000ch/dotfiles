# enable auto completion
autoload -Uz compinit && compinit

# enable colors
autoload -Uz colors && colors

# export LS_COLORS
eval $(gdircolors)

# apply LS_COLORS styles if defined
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

setopt auto_cd # omit cd to change directory
setopt auto_list # show completion list
setopt auto_menu # switch options by completion keys
setopt auto_param_slash # put / if it matches directory
setopt complete_in_word # enable completion in the word
setopt interactive_comments # set comment as #
setopt print_eight_bit # show japanese files
setopt magic_equal_subst # enable completion even after equal of command option
setopt mark_dirs # put / if it matches directory
setopt no_beep # omit beep sound

# lang
export LANG=ja_JP.UTF-8

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

# load dot files if exists
for file in $HOME/.{extensions,variables}; do
  if [ -r "$file" ]; then
    source "$file"
  fi
done