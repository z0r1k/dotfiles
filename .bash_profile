# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,bash_exports,bash_aliases,path,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# parse hosts defined in /etc/hosts
[ -e "/etc/hosts" ] && complete -o "default" -o "nospace" -W "$(grep -v '^[[:space:]]*$' /etc/hosts | grep -v '^#' | awk '{print $2}')" scp sftp ssh

chmod +x `brew --repository`/completions/bash/brew
source `brew --repository`/completions/bash/brew

# If possible, add tab completion for many more commands
[ -f $(brew --prefix)/etc/bash_completion ] && LANG=C LC_ALL=C source $(brew --prefix)/etc/bash_completion

# Docker completion
[ -f ~/.docker-completion/docker-compose.bash-completion ] && source ~/.docker-completion/docker-compose.bash-completion
[ -f ~/.docker-completion/docker-machine.bash-completion ] && source ~/.docker-completion/docker-machine.bash-completion
[ -f ~/.docker-completion/docker.bash-completion ] && source ~/.docker-completion/docker.bash-completion

# Grunt completion
eval "$(grunt --completion=bash)"

eval "$(thefuck --alias)"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Initializing direnv
eval "$(direnv hook $0)"

complete -C /usr/local/bin/vault vault
