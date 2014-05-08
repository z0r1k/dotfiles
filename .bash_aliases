# Application aliases
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias nw="/Users/z0r1k/Applications/node-webkit/node-webkit.app/Contents/MacOS/node-webkit"

# LS settings
alias ls='command ls -G'
alias la='ls -laF -G'
alias ll='ls -lF -G'

# Go up one and two directory
alias ..='cd ..'
alias ...='cd ../..'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Other
alias fucking='sudo'
alias psg='ps aux | grep -v grep | grep'
alias cls='clear'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
