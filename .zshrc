source ~/.antigen/antigen.zsh

antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle zsh-users/zsh-completions
antigen-bundle zsh-users/zsh-autosuggestions
antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-use oh-my-zsh
antigen-bundle --loc=lib/bzr.zsh
antigen-bundle --loc=lib/clipboard.zsh
antigen-bundle --loc=lib/compfix.zsh
antigen-bundle --loc=lib/completion.zsh
antigen-bundle --loc=lib/diagnostics.zsh
antigen-bundle --loc=lib/directories.zsh
antigen-bundle --loc=lib/functions.zsh
antigen-bundle --loc=lib/git.zsh
antigen-bundle --loc=lib/history.zsh
antigen-bundle --loc=lib/spectrum.zsh

antigen apply
