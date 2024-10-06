# symlinks
REPO="$(cd $(dirname $0); pwd)"
DOTFILES=(
  ".zshrc"
  ".zprofile"
  ".aliases"
  ".functions"
  ".gemrc"
  ".vimrc"
  ".gitconfig"
  ".editorconfig"
)

for dotfile in ${DOTFILES[@]} ; do
  if [ -L ${REPO}/${dotfile} ]; then
    rm -f ${REPO}/${dotfile}
  fi

  ln -sf ${REPO}/${dotfile} ~/${dotfile}
done
