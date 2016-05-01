/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew install vim
brew install wget
brew install tmux

if [ -f ~/.dotfiles/installed ]; then
   echo "~/.bashrc already updated ..."
   echo "Updating .dotfiles ..."
   cd ~/.dotfiles && git pull
else
   echo "Pulling .dotfiles"
   cd ~/ && git clone git@github.com:kcmerrill/.dotfiles.git
   echo "source ~/.dotfiles/.bash_extended" >> ~/.bashrc
   echo "source ~/.dotfiles/.bash_extended" >> ~/.bash_profile
   touch ~/.dotfiles/installed
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/Vundle.vim && git pull
cp ~/.dotfiles/.vimrc ~/.vimrc
cp ~/.dotfiles/.tmux.conf ~/.tmux.conf
cp ~/.dotfiles/.gitconfig ~/.gitconfig
vim +PluginInstall +qall
~/.vim/bundle/powerline-fonts/install.sh

source ~/.bashrc
source ~/.bash_profile
