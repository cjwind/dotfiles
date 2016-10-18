#!/bin/sh
# Build shell, vim, screen environment

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
$GIT config --global color.ui auto
$GIT config --global diff.tool vimdiff
$GIT config --global difftool.prompt false
$GIT config --global alias.d difftool

# link dotfiles
test -L ~/.tcshrc || $LN -s $PWD/tcshrc ~/.tcshrc
test -L ~/.screenrc || $LN -s $PWD/screenrc ~/.screenrc
test -L ~/.vimrc || $LN -s $PWD/vimrc ~/.vimrc
test -L ~/.inputrc || $LN -s $PWD/inputrc ~/.inputrc
test -L ~/.git-completion.bash || $LN -s $PWD/git/git-completion.bash ~/.git-completion.bash 
test -L ~/.git-prompt.sh || $LN -s $PWD/git/git-prompt.sh ~/.git-prompt.sh
test -f ~/.bashrc &&  $MV ~/.bashrc ~/.bashrc_old
test -L ~/.bashrc || $LN -s $PWD/bashrc ~/.bashrc
test -L ~/.bash_aliases || $LN -s $PWD/bash_aliases ~/.bash_aliases
test -L ~/.tmux.conf || $LN -s $PWD/tmux.conf ~/.tmux.conf

# install ctags (for vim plugin)
if [ "$distr" = "Ubuntu" ]; then
	sudo apt-get -y install ctags 
elif [ "$distr" = "Fedora" ]; then
	sudo yum -y install ctags
fi

# install vim plugin
test -d ~/.vim || $MKDIR ~/.vim
test -L ~/.vim/plugin || $LN -s $PWD/vimplugins/plugin ~/.vim/plugin
test -L ~/.vim/doc || $LN -s $PWD/vimplugins/doc ~/.vim/doc
