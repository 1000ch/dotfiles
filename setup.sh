# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
sh brew.sh

# set installed zsh & fish
echo "/usr/local/bin/zsh" >> /etc/shells
echo "/usr/local/bin/fish" >> /etc/shells
chsh -s /usr/local/bin/zsh

# set up zplug
curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
git clone https://github.com/milkbikis/powerline-shell ~/.powerline-shell
cd ~/.powerline-shell/;./install.sh

# install nodebrew, rbenv & ruby-build, pyenv, plenv & perl-build
curl -L git.io/nodebrew | perl - setup
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/tokuhirom/plenv.git ~/.plenv
git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build

# symlinks
if [ -f ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.exports ~/.exports
ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/.functions ~/.functions
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.editorconfig ~/.editorconfig
