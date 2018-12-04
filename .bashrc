# .bashrc
#
# Table of Contents
#   1. Setup PATH
#   2. Variables
#   3. Includes
#   4. Other Parties
#
# TODO: make a notification in the prompt when looking in folders in a 'www' or 'vhosts' folder

# Umask of 002 is so convenient...
umask 002

#
# 1. Setup PATH
#
# Note: the PATH priority goes by the directories listed first. So, to make a dir priority, do:
#
#   export PATH=/sbin:$PATH
#
# and to make a dir not priority do:
#
#   export PATH=$PATH:/sbin
#

export GOPATH=~/
export GOBIN=~/bin
export PATH=$PATH:/sbin
#export PATH=$PATH:/usr/bin
export PATH=$PATH:~/bin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/pear/bin:$PATH
export PATH=/opt/local/lib/php/pear/bin:$PATH
export PATH=/usr/lib/php/pear:$PATH
if [ `uname -s` = 'Darwin' ]; then
    export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
    # For MAMP:
    #export PATH=/Applications/MAMP/bin/php/php5.3.6/bin:$PATH
    #export PATH=/Applications/MAMP/Library/bin:$PATH
    # For MacPorts Apache + MySQL's MySQL:
    export PATH=/opt/local/apache2/bin:$PATH
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export PATH=/usr/local/mysql/bin:$PATH
fi

if [ -d ~/.composer ]
then
    export PATH=~/.composer/vendor/bin:$PATH
elif [ -d ~/.config/composer ]
then
    export PATH=~/.config/composer/vendor/bin:$PATH
fi

# If you use android emulator:
#export PATH=$PATH:/usr/local/bin/android-sdk-macosx/tools

#
# 2. Variables
#

export APPLICATION_ENV='development'
export ENVIRONMENT='development'
export HISTFILESIZE=20000000
export HISTSIZE=100000
# Support cloning Drupal.org repos.
export GIT_SSH_COMMAND='ssh -o KexAlgorithms=+diffie-hellman-group1-sha1'

# have grep highlight words found
# NOTE: deprecated on linux??
#export GREP_COLOR='1;32' # green (this may get overwritten by bash_prompt)
#export GREP_OPTIONS='--color=auto'

export EDITOR=vim
export VISUAL=vim

# not sure why I needed this...
export CC=/usr/bin/gcc

#
# 3. Includes
#

# warn if we dont have inputrc, bc it's that awesome
if [ ! -f ~/.inputrc ]; then
    echo "WARNING: .inputrc is not in your home directory!"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

for x in ~/.bash_includes/*
do
	SHORT=`echo $x | sed "s/.*\///g"`
	if [ "$SHORT" != "bash_prompt" ]
	then
		source $x
	fi
done

# Bash Prompt
if [ -f ~/.bash_includes/bash_prompt ]; then
    source ~/.bash_includes/bash_prompt
fi

#
# 4. Other Parties
#

# Ruby Version Manager
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# Show a fortune at login
# http://fortunes.cat-v.org/
# http://fortune.smithsforge.com/
#if [ -x /opt/local/bin/fortune ]
#then
#    /opt/local/bin/fortune -s
#fi

#PERL_MB_OPT="--install_base \"/Users/joepurcell/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/Users/joepurcell/perl5"; export PERL_MM_OPT;

# Allow CTRL+Q to pass to Vim.
stty -ixon

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

VAGRANT_DEFAULT_PROVIDER='virtualbox'

# Set key delay and key repeat 
# Format: <delay> <repeat>
# Fast:
xset r rate 200 60
# Slow:
#xset r rate 660 25
