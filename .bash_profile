# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_exports,bash_aliases,bash_prompt,path,functions,extra}; do
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
[ -f $(brew --prefix)/etc/bash_completion.d ] && LANG=C LC_ALL=C source $(brew --prefix)/etc/bash_completion.d

# bash-completion@2
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
	. $(brew --prefix)/share/bash-completion/bash_completion
fi

# Docker completion
[ -f ~/.docker-completion/docker.bash-completion ] && source ~/.docker-completion/docker.bash-completion
[ -f ~/.docker-completion/docker-compose.bash-completion ] && source ~/.docker-completion/docker-compose.bash-completion
[ -f ~/.docker-completion/docker-machine.bash-completion ] && source ~/.docker-completion/docker-machine.bash-completion

# GIT completion
[ -f ~/.git-completion/git-completion.bash ] && source ~/.git-completion/git-completion.bash

# Grunt completion
eval "$(grunt --completion=bash)"

# Vault completion
complete -C /usr/local/bin/vault vault

# Azure completion
[ -f ~/.azure-completion/az.bash-completion ] && source ~/.azure-completion/az.bash-completion

# Kube completion
source <(kubectl completion bash)

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Initializing direnv
eval "$(direnv hook $0)"

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
