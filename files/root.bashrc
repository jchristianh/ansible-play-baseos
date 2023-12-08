# /etc/skel/.bashrc:
# $Header: /home/cvsroot/gentoo-src/rc-scripts/etc/skel/.bashrc,v 1.7 2002/11/18 19:39:22 azarah Exp $

# This file is sourced by all *interactive* bash shells on startup.  This
# file *should generate no output* or it will break the scp and rcp commands.

######## TTY Colours #######

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

### linux console colors (jwr dark) ###

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P83d3d3d" #darkgrey
    echo -en "\e]P18c4665" #darkred
    echo -en "\e]P9bf4d80" #red
    echo -en "\e]P2287373" #darkgreen
    echo -en "\e]PA53a6a6" #green
    echo -en "\e]P3914e89" #brown
    echo -en "\e]PBbf85cc" #yellow
    echo -en "\e]P4395573" #darkblue
    echo -en "\e]PC477ab3" #blue
    echo -en "\e]P55e468c" #darkmagenta
    echo -en "\e]PD7e62b3" #magenta
    echo -en "\e]P631658c" #darkcyan
    echo -en "\e]PE6096bf" #cyan
    echo -en "\e]P7899ca1" #lightgrey
    echo -en "\e]PFc0c0c0" #white
    clear # bring us back to default input colours
fi


# colors for ls, etc.
alias bc="bc -q"
alias d="ls --color"
alias ls="ls -F --color=auto"
alias ll="ls --color -al"
alias cls="clear"
alias kansai="ssh kansai"
alias amaterasu="ssh amaterasu"
alias tokyo="ssh tokyo"
alias tm="clear;tail -f /var/log/messages"
alias tz="clear;tail -f /virtual/thezengarden.net/logs/access_log"
alias nslookup="nslookup -sil"
#alias do="sudo"
alias watch="watch -t -n 2"
#alias up="watch -t -n 10 uptime"
alias loads="/home/chris/scripts/monitor/loadwatch.sh"
alias wwwrestart='/home/chris/scripts/www/restart_webnodes.sh'

alias block="/home/chris/scripts/ipblock.sh"

alias update="/home/chris/scripts/update_system.sh"

alias localtime=\
'perl -e '\''print scalar localtime(shift||time),"\n"'\'''

alias bigfiles="find . -maxdepth 15 -type f -exec du -ckx {} \; | grep -v total | sort -rn > /home/chris/files.lst"
alias top10="du -a . | sort -nr | head -n 10"


export PS1='\h: \[\033[1;31m\]\w\[\033[0m\]\[\033[0m\]> '

export EDITOR=vim

# find partition name for a given filename
findpart() { [ -e "$1" ] && df -P "$1"  | awk '/^\/dev/ {print $1}' || echo "$1 not found"; }

export XDG_CONFIG_HOME="/home/chris/.config"
export TERM="xterm-256color"


#alias lxcmon='watch -t -n .3 "grep hwaddr /var/lib/lxc/*/config|grep -v '\''#'\'';echo && echo "running containers:" && lxc-ls --active"'
alias lxcmon='watch -t -n .3 /root/lxcmon.pl'
alias lxcmon2='watch -t -n .3 /root/lxcmon2.pl'
