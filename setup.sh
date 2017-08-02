# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh brew.sh

# set installed zsh & fish
echo "/usr/local/bin/zsh" >> /etc/shells
echo "/usr/local/bin/fish" >> /etc/shells
chsh -s /usr/local/bin/zsh

# set up antigen
git clone https://github.com/zsh-users/antigen.git ~/.antigen
git clone https://github.com/banga/powerline-shell.git ~/.powerline-shell
cd ~/.powerline-shell;./install.sh

# install nodenv, rbenv & ruby-build, pyenv, plenv & perl-build
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
git clone https://github.com/nodenv/nodenv-package-rehash.git ~/.nodenv/plugins/nodenv-package-rehash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/tokuhirom/plenv.git ~/.plenv
git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build

# symlinks
ln -sf ~/workspace/dotfiles/.zshrc ~/.zshrc
ln -sf ~/workspace/dotfiles/.zprofile ~/.zprofile
ln -sf ~/workspace/dotfiles/.exports ~/.exports
ln -sf ~/workspace/dotfiles/.aliases ~/.aliases
ln -sf ~/workspace/dotfiles/.functions ~/.functions
ln -sf ~/workspace/dotfiles/.gemrc ~/.gemrc
ln -sf ~/workspace/dotfiles/.vimrc ~/.vimrc
ln -sf ~/workspace/dotfiles/.vimrc.basic ~/.vimrc.basic
ln -sf ~/workspace/dotfiles/.vimrc.editor ~/.vimrc.editor
ln -sf ~/workspace/dotfiles/.vimrc.encoding ~/.vimrc.encoding
ln -sf ~/workspace/dotfiles/.vimrc.plugins ~/.vimrc.plugins
ln -sf ~/workspace/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/workspace/dotfiles/.editorconfig ~/.editorconfig
ln -sf ~/workspace/dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
