# .bashrc
#
# TODO: make a for loop for sourcing bash includes

umask 002

export PATH=$PATH:/opt/local/bin

export EDITOR=vim
export VISUAL=vim

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source bash_includes

if [ -f ~/.bash_includes/git-completion.bash ]; then
    source ~/.bash_includes/git-completion.bash
fi

if [ -f ~/inputrc ]; then
    source ~/.bash_includes/inputrc
fi

if [ -f ~/.bash_includes/functions ]; then
    source ~/.bash_includes/functions
fi

if [ -f ~/.bash_includes/functions_work ]; then
    source ~/.bash_includes/functions_work
fi

if [ -f ~/.bash_includes/aliases ]; then
    source ~/.bash_includes/aliases
fi

if [ -f ~/.bash_includes/aliases_work ]; then
    source ~/.bash_includes/aliases_work
fi

if [ -f ~/.bash_includes/aliases_home ]; then
    source ~/.bash_includes/aliases_home
fi

if [ -f ~/.bash_includes/bash_prompt ]; then
    source ~/.bash_includes/bash_prompt
fi

# Source bash includes
#if [ -d ~/.bash_includes ]; then
#    for x in ~/.bash_includes/*
#    do
#        source $x
#    done
#fi

# Show a fortune at login
if [ -x /opt/local/bin/fortune ]; then
    /opt/local/bin/fortune -s
fi

