source_if_exists() {
  if [ -f "$1" -a -r "$1" ]; then
    source "$1"
  elif [ ! -e "$1" ]; then
    # -e checks whether "$1" exists or not
    echo "$1 is ignored because it doesn't exist"
  elif [ ! -f "$1" ]; then
    # -f checks whether "$1" is a file or not
    echo "$1 is ignored because it's not a file"
  elif [ ! -r "$1" ]; then
    # -r checks whether "$1" is readable or not
    echo "$1 is ignored because it's not readable"
  fi
}

# Enable antigen (`brew` is enabled on `.zprofile` beforehand)
source_if_exists "$(brew --prefix)/share/antigen/antigen.zsh"

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
source_if_exists "$DOTREPO/zsh/.extensions"

# Load several dotfiles if exists
for file in $HOME/.{local,variables}; do
  source_if_exists "$file"
done
