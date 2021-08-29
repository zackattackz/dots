#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

(cat ~/.cache/wal/sequences &)

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
