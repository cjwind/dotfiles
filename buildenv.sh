#!/bin/sh

# 1. install git
# 	Detect distribution and use their command to install git

# 2. set git config
git config --global user.name "cjwind"
git config --global user.email "cwentsai@gmail.com"

# 3. git clone dotfiles
#	There will be ssh known host problem
cd ~
git clone https://github.com/cjwind/dotfiles.git dotfiles

# 4. copy dotfiles
cp dotfiles/tcshrc ~/.tcshrc
cp dotfiles/screenrc ~/.screenrc
cp dotfiles/vimrc ~/.vimrc
mkdir ~/.vim
cd ~/.vim
tar -zxvf ~/dotfiles/vimplugins/taglist_45.tar.gz

# 5. install ctags (for vim plugin)
