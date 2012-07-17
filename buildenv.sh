#!/bin/sh
# Build shell, vim, screen environment
# cjwind @ 2012/7/17

GIT="/usr/bin/git"
CP="/bin/cp"
MKDIR="/bin/mkdir"
TAR="/bin/tar"

# git settings
gituser="cjwind"
gitmail="cwentsai@gmail.com"

# 1. install git
# 	Detect distribution and use their command to install git

# 2. set git config
$GIT config --global user.name $gituser
$GIT config --global user.email $gitmail

# 3. git clone dotfiles
$GIT clone https://github.com/cjwind/dotfiles.git ~/dotfiles

# 4. copy dotfiles
$CP dotfiles/tcshrc ~/.tcshrc
$CP dotfiles/screenrc ~/.screenrc
$CP dotfiles/vimrc ~/.vimrc

# 5. install ctags (for vim plugin)

# 6. install vim plugin
$MKDIR ~/.vim
$TAR -C ~/.vim -zxvf ~/dotfiles/vimplugins/taglist_45.tar.gz

