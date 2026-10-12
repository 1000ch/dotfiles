# Enable Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Disable following packages in Homebrew context
export HOMEBREW_FORBIDDEN_FORMULAE="node python python3 pip npm pnpm"

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
eval "$(nodenv init -)"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# gopath
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Google Cloud SDK (extracted tarball at $HOME/google-cloud-sdk)
export CLOUDSDK_ROOT="$HOME/google-cloud-sdk"
[ -f "$CLOUDSDK_ROOT/path.zsh.inc" ] && source "$CLOUDSDK_ROOT/path.zsh.inc"

# GPG
export GPG_TTY=$TTY

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
