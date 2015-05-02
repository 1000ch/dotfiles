# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install homebrew-bundle
brew tap Homebrew/bundle
# update & upgrade
brew update
brew upgrade
# bundle using Brewfile
brew install caskroom/cask/brew-cask
brew bundle
# cleanup
brew cleanup


# set up oh-my-zsh
~/dotfiles/oh-my-zsh/tools/install.sh | ZSH=~/dotfiles/oh-my-zsh sh
# create hard-link to oh-my-zsh-powerline-theme from oh-my-zsh/themes
ln -f ~/dotfiles/oh-my-zsh-powerline-theme/powerline.zsh-theme ~/dotfiles/oh-my-zsh/themes/powerline.zsh-theme



# install nvm
git clone https://github.com/creationix/nvm.git ~/.nvm



# install rbenv & ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build



# install pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv



# symlinks
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.editorconfig ~/.editorconfig
