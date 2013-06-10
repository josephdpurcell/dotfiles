# .bashrc
#
# Table of Contents
#   1. Setup PATH
#   2. Variables
#   3. Includes
#   4. Other Parties
#
# TODO: make a notification in the prompt when looking in folders in a 'www' or 'vhosts' folder

umask 002

#
# 1. Setup PATH
#

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:/sbin
#export PATH=$PATH:/usr/local/bin/android-sdk-macosx/tools
export PATH=$PATH:/usr/bin
export PATH=$PATH:~/bin
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=/usr/local/share/pear/bin:$PATH
if [ `uname -s` = 'Darwin' ]; then
	export PATH=/Applications/MAMP/bin/php/php5.3.6/bin:$PATH
    export PATH=/Applications/MAMP/Library/bin:$PATH
fi

#
# 2. Variables
#

export APPLICATION_ENV='development'

# have grep highlight words found
export GREP_COLOR='1;32' # green (this may get overwritten by bash_prompt)
export GREP_OPTIONS='--color=auto'

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
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# Show a fortune at login
# http://fortunes.cat-v.org/
# http://fortune.smithsforge.com/
if [ -x /opt/local/bin/fortune ]; then
    /opt/local/bin/fortune -s
fi

