# set up oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# install powerline theme
git clone git@github.com:jeremyFreeAgent/oh-my-zsh-powerline-theme.git
pushd oh-my-zsh-powerline-theme
sh ./install_in_omz.sh
popd

# install nvm
git clone https://github.com/creationix/nvm.git ~/.nvm

# install rbenv & ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# install pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv



# symlinks
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.gitconfig ~/.gitconfig