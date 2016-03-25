#!/bin/sh
# Build shell, vim, screen environment
# cjwind @ 2012/7/17

GIT="/usr/bin/git"
CP="/bin/cp"
MKDIR="/bin/mkdir"
TAR="/bin/tar"
PATCH="/usr/bin/patch"

# git settings
gituser="cjwind"
gitmail="cwentsai@gmail.com"

# TODO: need check if user is root
# TODO: need to check if software has installed

# 1. install git
# 	Detect distribution and use their command to install git
distr=`head -n 1 /etc/issue | awk '{print $1}'`
#if [ "$distr" = "Ubuntu" ]; then
#	apt-get -y install git
#elif [ "$distr" = "Fedora" ]; then
#	yum -y install git
#else
#	echo "Not know distribution...STOP"
#	exit 0
#fi

# 2. set git config
$GIT config --global user.name $gituser
$GIT config --global user.email $gitmail
$GIT config --global alias.co checkout
$GIT config --global alias.st status
$GIT config --global alias.ci commit
$GIT config --global alias.a add
$GIT config --global core.editor vim

# 3. git clone dotfiles
test -d ~/dotfiles || $GIT clone https://github.com/cjwind/dotfiles.git ~/dotfiles

# 4. copy dotfiles
$CP ~/dotfiles/tcshrc ~/.tcshrc
$CP ~/dotfiles/screenrc ~/.screenrc
$CP ~/dotfiles/vimrc ~/.vimrc
$CP ~/dotfiles/inputrc ~/.inputrc
$CP ~/dotfiles/git-completion.bash ~/.git-completion.bash 
$CP ~/dotfiles/bash_aliases ~/.bash_aliases

# 5. install ctags (for vim plugin)
if [ "$distr" = "Ubuntu" ]; then
	apt-get -y install ctags 
elif [ "$distr" = "Fedora" ]; then
	yum -y install ctags
fi

# 6. install vim plugin
$MKDIR ~/.vim
$TAR -C ~/.vim -zxvf ~/dotfiles/vimplugins/taglist/taglist_45.tar.gz
$CP ./vimplugins/autohighlight.vim ~/.vim/plugin
$CP ./vimplugins/auto-pairs.vim ~/.vim/plugin
$CP ./vimplugins/a.vim ~/.vim/plugin

# 6.1 patch taglist plugin 
$PATCH -p0 ~/.vim/plugin/taglist.vim ~/dotfiles/vimplugins/taglist/taglist.diff

