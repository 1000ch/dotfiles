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


# set up zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
git clone https://github.com/zsh-users/zsh-completions ~/.zsh-completions
git clone https://github.com/milkbikis/powerline-shell ~/.powerline-shell
cd ~/.powerline-shell/;./install.sh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


# install nvm & rbenv + ruby-build & pyenv
git clone https://github.com/creationix/nvm.git ~/.nvm
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
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
