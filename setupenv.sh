#!/bin/sh
# Build shell, vim, screen environment
# cjwind @ 2012/7/17

GIT="/usr/bin/git"
CP="/bin/cp"
MKDIR="/bin/mkdir"
TAR="/bin/tar"
PATCH="/usr/bin/patch"
LN="/bin/ln"

# Detect distribution
distr=`head -n 1 /etc/issue | awk '{print $1}'`

# git settings
gituser="cjwind"
gitmail="cwentsai@gmail.com"

# TODO: need to check if software has installed

# install git
#if [ "$distr" = "Ubuntu" ]; then
#	sudo apt-get -y install git
#elif [ "$distr" = "Fedora" ]; then
#	sudo yum -y install git
#else
#	echo "Not know distribution...STOP"
#	exit 0
#fi

# set git config
$GIT config --global user.name $gituser
$GIT config --global user.email $gitmail
$GIT config --global alias.co checkout
$GIT config --global alias.st status
$GIT config --global alias.ci commit
$GIT config --global alias.a add
$GIT config --global core.editor vim

# link dotfiles
$LN -s $PWD/tcshrc ~/.tcshrc
$LN -s $PWD/screenrc ~/.screenrc
$LN -s $PWD/vimrc ~/.vimrc
$LN -s $PWD/inputrc ~/.inputrc
$LN -s $PWD/git-completion.bash ~/.git-completion.bash 
$LN -s $PWD/bashrc ~/.bashrc
$LN -s $PWD/bash_aliases ~/.bash_aliases
$LN -s $PWD/tmux.conf ~/.tmux.conf

# install ctags (for vim plugin)
if [ "$distr" = "Ubuntu" ]; then
	sudo apt-get -y install ctags 
elif [ "$distr" = "Fedora" ]; then
	sudo yum -y install ctags
fi

# install vim plugin
$MKDIR ~/.vim
$TAR -C ~/.vim -zxvf ~/dotfiles/vimplugins/taglist/taglist_45.tar.gz
$CP ./vimplugins/autohighlight.vim ~/.vim/plugin
$CP ./vimplugins/auto-pairs.vim ~/.vim/plugin
$CP ./vimplugins/a.vim ~/.vim/plugin

# patch taglist plugin 
$PATCH -p0 ~/.vim/plugin/taglist.vim ~/dotfiles/vimplugins/taglist/taglist.diff

