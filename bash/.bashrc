#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# opencode
export PATH=/home/joyboy/.opencode/bin:$PATH

alias vps='ssh antigravity'

export PATH="$HOME/.local/bin:$PATH"
alias w="/home/joyboy/Desktop/mov-cli-arabic/cinepro/bin/w"
