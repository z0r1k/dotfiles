# Application aliases
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
#alias nw="/Users/z0r1k/Applications/node-webkit-v0.8.4-osx-ia32/nwsnapshot"

# LS settings
alias la='ls -lashbFHOG'
alias ll='ls -lh'

# Go up one and two directory
alias ..='cd ..'
alias ...='cd ../..'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0 || ipconfig getifaddr en4"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Other
alias fucking='sudo'
eval "$(thefuck --alias)"
alias psg='ps aux | grep -v grep | grep'
alias cls='clear'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc"
[ -e "${jscbin}" ] && alias jsc="${jscbin}"
unset jscbin

# Faster npm for europeans
command -v npm > /dev/null && alias npme="npm --registry http://registry.npmjs.eu"
