# symlinks
REPO="$(cd $(dirname $0); pwd)"
DOTFILES=(
  ".zshrc"
  ".zprofile"
  ".exports"
  ".aliases"
  ".functions"
  ".gemrc"
  ".vimrc"
  ".vimrc.basic"
  ".vimrc.editor"
  ".vimrc.encoding"
  ".vimrc.plugins"
  ".gitconfig"
  ".editorconfig"
)

for dotfile in ${DOTFILES[@]} ; do
  if [ -L ${REPO}/${dotfile} ]; then
    rm -f ${REPO}/${dotfile}
  fi

  ln -sf ${REPO}/${dotfile} ~/${dotfile}
done
