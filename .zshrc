source $(brew --prefix)/share/antigen/antigen.zsh

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

for zsh_plugin in ${ZSH_PLUGINS[@]} ; do
  antigen bundle ${zsh_plugin}
done

antigen apply
