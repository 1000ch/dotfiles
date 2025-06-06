# Load log.zsh
source "$ZDOTDIR/log.zsh"

# -a      Include directory entries whose names begin with a dot (‘.’).
# -l      (The lowercase letter “ell”.) List files in the long format, as described in the The Long Format subsection below.
# -h      When used with the -l option, use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte in order to reduce the number of digits to four or fewer using base 2 for sizes.  This option is not defined in IEEE Std 1003.1-2008 (“POSIX.1”).
# -F      Display a slash (‘/’) immediately after each pathname that is a directory, an asterisk (‘*’) after each that is executable, an at sign (‘@’) after each symbolic link, an equals sign (‘=’) after each socket, a percent sign (‘%’) after each whiteout, and a vertical bar (‘|’) after each that is a FIFO.
alias ls='ls -alhF --color'

# -v      Cause mv to be verbose, showing files after they are moved.
alias mv='mv -v'

# -i      Request confirmation before attempting to remove each file, regardless of the file's permissions, or whether or not the standard input device is a terminal.  The -i option overrides any previous -f options.
# -v      Be verbose when deleting files, showing them as they are removed.
alias rm='rm -i -v'

# -v    Cause cp to be verbose, showing files as they are copied.
alias cp='cp -v'

alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias dig='dig +nocmd any +multiline +noall +answer'
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"
alias diskspace='df -P -kHl'
alias apps='\ls -1 /Applications | sed s/.app// | fzf'
alias repos='ghq list -p | fzf'
alias repo='cd $(repos)'
alias vscode='code $(repos)'
alias reload='exec -l $SHELL'

app() {
  open "${1:-.}" -a "$(apps)"
}

fork() {
  open "$1" -a Fork
}

update() {
  log "Updating dotfiles..." green
  git -C "$DOTREPO" pull
  log

  log "Updating Homebrew and it's packages..." green
  brew upgrade
  log

  log "Updating zimfw..." green
  zimfw upgrade
  log

  log "Updating zimfw's packages..." green
  zimfw update
}

update_git_repos() {
  git_repos=($(ghq list -p))

  for git_repo in "${git_repos[@]}"; do
    if [ -d "$git_repo" ]; then
      log "Updating $git_repo..." green
      git -C "$git_repo" pull
      log
    fi
  done
}

cleanup() {
  brew cleanup -s
  zimfw clean
}

cleanup_zsh() {
  ZSH_TMPS=(
    '.zcompdump'
    '.zsh_history'
    '.zshrc.zwc'
  )

  for zsh_tmp in "${ZSH_TMPS[@]}"; do
    find "$ZDOTDIR" -name "$zsh_tmp" -type f -ls -delete
  done
}

trash() {
  mv "$1" "$HOME/.Trash/"
}

compare() {
  echo "original size (bytes): $(cat "$1" | wc -c)"
  echo "    gzip size (bytes): $(gzip -c "$1" | wc -c)"
  echo "  zopfli size (bytes): $(zopfli -c "$1" | wc -c)"
  echo "  brotli size (bytes): $(bro --input "$1" | wc -c)"
}
