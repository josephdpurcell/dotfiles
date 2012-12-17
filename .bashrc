# .bashrc
#
# TODO: make a for loop for sourcing bash includes
# TODO: make a notification in the prompt when looking in folders in a 'www' or 'vhosts' folder
##
# Your previous /Volumes/Data/Users/jpurcell/.bash_profile file was backed up as /Volumes/Data/Users/jpurcell/.bash_profile.macports-saved_2012-12-03_at_16:49:10
##

umask 002

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#export PATH=$PATH:/usr/local/bin/android-sdk-macosx/tools
export PATH=$PATH:/usr/bin
export PATH=$PATH:~/bin
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/share/pear/bin

export APPLICATION_ENV='development'

# have grep highlight words found
export GREP_COLOR='1;32' # green (this may get overwritten by bash_prompt)
export GREP_OPTIONS='--color=auto'

export EDITOR=vim
export VISUAL=vim

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#
# Core
#

if [ ! -f ~/.inputrc ]; then
    echo "WARNING: .inputrc is not in your home directory!"
fi

#
# Includes (except for the prompt, we do that last)
#
for x in ~/.bash_includes/*
do
	SHORT=`echo $x | sed "s/.*\///g"`
	if [ "$SHORT" != "bash_prompt" ]
	then
		source $x
	fi
done

#
# Bash Prompt
#

if [ -f ~/.bash_includes/bash_prompt ]; then
    source ~/.bash_includes/bash_prompt
fi

# Show a fortune at login
if [ -x /opt/local/bin/fortune ]; then
    /opt/local/bin/fortune
fi

