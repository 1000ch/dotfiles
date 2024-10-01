# symlinks
DOTFILES="$(cd $(dirname $0); pwd)"

ln -sf `$DOTFILES/.zshrc` ~/.zshrc
ln -sf `$DOTFILES/.zprofile` ~/.zprofile
ln -sf `$DOTFILES/.exports` ~/.exports
ln -sf `$DOTFILES/.aliases` ~/.aliases
ln -sf `$DOTFILES/.functions` ~/.functions
ln -sf `$DOTFILES/.gemrc` ~/.gemrc
ln -sf `$DOTFILES/.vimrc` ~/.vimrc
ln -sf `$DOTFILES/.vimrc.basic` ~/.vimrc.basic
ln -sf `$DOTFILES/.vimrc.editor` ~/.vimrc.editor
ln -sf `$DOTFILES/.vimrc.encoding` ~/.vimrc.encoding
ln -sf `$DOTFILES/.vimrc.plugins` ~/.vimrc.plugins
ln -sf `$DOTFILES/.gitconfig` ~/.gitconfig
ln -sf `$DOTFILES/.editorconfig` ~/.editorconfig
