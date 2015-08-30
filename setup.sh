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



# set installed zsh & fish
echo "/usr/local/bin/zsh" >> /etc/shells
echo "/usr/local/bin/fish" >> /etc/shells
chsh -s /usr/local/bin/zsh



# set up oh-my-fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish



# set up oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# create hard-link to oh-my-zsh-powerline-theme from oh-my-zsh/themes
git clone git@github.com:jeremyFreeAgent/oh-my-zsh-powerline-theme.git ~/.oh-my-zsh-powerline-theme
ln -f ~/.oh-my-zsh-powerline-theme/powerline.zsh-theme ~/.oh-my-zsh/themes/powerline.zsh-theme
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/milkbikis/powerline-shell ~/.powerline-shell
cd ~/.powerline-shell/;./install.sh


# install nvm
git clone https://github.com/creationix/nvm.git ~/.nvm



# install rbenv & ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build



# install pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv



# symlinks
if [ -f ~/.config/fish/config.fish ]; then
  rm ~/.config/fish/config.fish
fi
if [ -f ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -s ~/dotfiles/.config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.editorconfig ~/.editorconfig
