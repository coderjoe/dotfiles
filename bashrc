# If not running interactively, don't do anything except set RVM
if [[ -n "$PS1" ]] ; then
    source ~/.bash/config
    source ~/.bash/path
    source ~/.bash/completions
    source ~/.bash/aliases
    source ~/.bash/prompt
fi

source ~/.bash/rvm
source ~/.bash/rbenv
