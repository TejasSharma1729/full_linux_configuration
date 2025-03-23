# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u \[\033[01;35m\]\t \[\033[01;34m\]\W \[\033[01;32m\]$\[\033[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u \[\033[01;35m\]\t \[\033[01;34m\]\W \[\033[01;32m\]$\[\033[0m\] '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# some more ls aliases

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi
alias ll='ls -alhG '
alias llr='ls -alhRG '
alias l='ls -aCG '
alias lr='ls -aCRG '
alias rd='rm -rf '
alias d='du -h -d 1 '
alias sudo='sudo '
alias cr='cp -rf '
alias clear='reset && clear '
export EDITOR=nvim
export CXX=g++
export CC=gcc
export CXXFLAGS='-std=c++23 -g3 -pthread -Wall -Wshadow -Wuninitialized -Wno-unused-variable -Wtype-limits'
export CFLAGS='-std=c17 -g3 -pthread -Wall -Wpedantic -Wshadow -Wuninitialized -Wno-unused-variable -Wtype-limits'
export CSTRICT='-fsanitize=address,undefined,leak,bounds -Werror'
export CTHREAD='-fsanitize=thread,undefined,bounds -Werror'
alias h++='$CXX $CXXFLAGS -c '
alias c++='$CXX $CXXFLAGS '
alias hpp='$CXX $CXXFLAGS -c '
alias cpp='$CXX $CXXFLAGS '
alias hcc='$CC $CFLAGS -c '
alias cc='$CC $CFLAGS '
alias h++strict='$CXX $CXXFLAGS $CSTRICT -c '
alias c++strict='$CXX $CXXFLAGS $CSTRICT '
alias hppstrict='$CXX $CXXFLAGS $CSTRICT -c '
alias cppstrict='$CXX $CXXFLAGS $CSTRICT '
alias hccstrict='$CC $CFLAGS $CSTRICT -c '
alias ccstrict='$CC $CFLAGS $CSTRICT '
alias h++thread='$CXX $CXXFLAGS $CTHREAD -c '
alias c++thread='$CXX $CXXFLAGS $CTHREAD '
alias hppthread='$CXX $CXXFLAGS $CTHREAD -c '
alias cppthread='$CXX $CXXFLAGS $CTHREAD '
alias hccthread='$CC $CFLAGS $CTHREAD -c '
alias ccthread='$CC $CFLAGS $CTHREAD '
export PYTHONSTARTUP=~/.pythonrc
alias pipi="/usr/bin/python3 -m pip install --upgrade --break-system-packages "
alias py="PYTHONSTARTUP=$HOME/.pythonrc python3 -q "
alias python="PYTHONSTARTUP=$HOME/.pythonstartup /usr/bin/python3 -q "
alias ipy="PYTHONSTARTUP=$HOME/.pythonrc python3 -m IPython --pdb --no-banner "
alias ipython="PYTHONSTARTUP=$HOME/.pythonstartup /usr/bin/python3 -m IPython --pdb --no-banner "
alias gdb='gdb -q '

