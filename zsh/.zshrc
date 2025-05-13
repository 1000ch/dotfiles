source_if_exists() {
  if [ -f "$1" -a -r "$1" ]; then
    source "$1" "$2"
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

# Enable starship
eval "$(starship init zsh)"

# Enable prompt to customize themes
autoload -Uz promptinit; promptinit

# Enable auto completion after loading zsh plugins
autoload -Uz compinit; compinit

# Enable colors
autoload -Uz colors; colors

# Export LS_COLORS
eval "$(gdircolors)"

# Apply LS_COLORS styles if defined
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# Load custom aliases/functions
source_if_exists "$DOTREPO/zsh/extra.zsh"

# Load several dotfiles if exists
for file in $HOME/.{local,variables}; do
  source_if_exists "$file"
done

# Install missing modules and update $ZIM_HOME/init.zsh if missing or outdated.
if [[ ! $ZIM_HOME/init.zsh -nt $ZIM_CONFIG_FILE ]]; then
  source_if_exists "$(brew --prefix)/opt/zimfw/share/zimfw.zsh" init
fi

# Initialize zim modules.
source_if_exists "$ZIM_HOME/init.zsh"
