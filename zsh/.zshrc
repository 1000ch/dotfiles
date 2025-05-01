load_if_exists() {
  if [ -r "$1" ]; then
    source "$1"
  else
    echo "$1 is ignored because it doesn't exist"
  fi
}

# Enable antigen (`brew` is enabled on `.zprofile` beforehand)
load_if_exists "$(brew --prefix)/share/antigen/antigen.zsh"

# Enable starship
eval "$(starship init zsh)"

ZSH_PLUGINS=(
  "command-not-found"
  "zsh-interactive-cd"
  "zsh-users/zsh-history-substring-search"
  "zsh-users/zsh-completions"
  "zsh-users/zsh-autosuggestions"
  "zsh-users/zsh-syntax-highlighting"
  "--loc=plugins/ssh-agent/ssh-agent.plugin.zsh"
)

# Bundle zsh plugins
for zsh_plugin in ${ZSH_PLUGINS[@]} ; do
  antigen bundle "$zsh_plugin"
done

antigen apply

# Enable auto completion after loading zsh plugins
autoload -Uz compinit && compinit

# Enable colors
autoload -Uz colors && colors

# Export LS_COLORS
eval "$(gdircolors)"

# Apply LS_COLORS styles if defined
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# Load custom aliases/functions
load_if_exists "$DOTREPO/zsh/.extensions"

# Load several dotfiles if exists
for file in $HOME/.{local,variables}; do
  load_if_exists "$file"
done
