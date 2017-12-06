# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# User specific aliases and functions

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# User prompt
# export PS1="\u@\h:\W\\ $ "

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
    export GIT_EDITOR='vim'
else
    export EDITOR='vim'
    export GIT_EDITOR='vim'
fi

#
# Completion settings
#

# Enable completion
## for windows
if [ "$(uname)" = "Msys" ]; then
    source /usr/share/git/completion/git-prompt.sh
    source /usr/share/git/completion/git-completion.bash
## for Linux
elif [ "$(uname)" = "Linux" ]; then
    # Load Bash completion
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        source /etc/bash_completion
    fi
    if [ -f /etc/profile.d/bash_completion.sh ] && ! shopt -oq posix; then
        source /etc/profile.d/bash_completion.sh
    fi
    # Load Git completion
    if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ] && ! shopt -oq posix; then
        source /usr/share/git-core/contrib/completion/git-prompt.sh
    fi
    if [/etc/bash_completion.d/git] && ! shopt -oq posix; then
    source /etc/bash_completion.d/git
    fi
## for mac
elif [ "$(uname)" = "Darwin" ]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
    source /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Tab completion for ssh hosts, from known_hosts.
if [ -f ~/.ssh/known_hosts ]; then
  complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
fi
#
# Git configuration
#
GIT_PS1_SHOWDIRTYSTATE=true
#
# Prompt configuration
#
PS1='\[\033[32m\]\u@\h:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
# export PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;30m\]\u@\h\[\033[01;34m\] \w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;31m\]]$\[\033[00m\] '
