for file in ~/.{exports,aliases,functions,localconfig}; do
  [ -r "$file" ] && source "$file"
done

function powerline_precmd() {
  PS1="$(~/.powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
  install_powerline_precmd
fi

if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# lang
export LANG=ja_JP.UTF-8

# show japanese files
setopt print_eight_bit

# set comment as #
setopt interactive_comments

# nodenv, rbenv, pyenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
eval "$(direnv hook zsh)"
