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

#
# NB! autocomplete for ssh hosts bellow will override all autocomplete settings above :(
#
# parse all hosts found in .ssh/known_hosts
#if [ -r "$HOME/.ssh/known_hosts" ]; then
#    if grep -v -q -e '^ ssh-rsa' "$HOME/.ssh/known_hosts" ; then
#        complete -o "default" -o "nospace" -W "$(awk '{print $1}' $HOME/.ssh/known_hosts | cut -d, -f 1 | sed -e 's/\[//g' | sed -e 's/\]//g' | cut -d: -f1 | grep -v ssh-rsa)" scp sftp ssh
#    fi
#fi
#
# parse hosts defined in /etc/hosts
#[ -e "/etc/hosts" ] && complete -o "default" -o "nospace" -W "$(grep -v '^[[:space:]]*$' /etc/hosts | grep -v '^#' | awk '{print $2}')" scp sftp ssh
#

# Homebrew completion
source `brew --repository`/completions/bash/brew

# If possible, add tab completion for many more commands
[ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion
#if [ -d $(brew --prefix)/etc/bash_completion.d ]; then
# 	for F in $(brew --prefix)/etc/bash_completion.d/*; do
#         if [ -f "${F}" ]; then
#             . "${F}";
#         fi
# 	done
# fi

# Grunt completion
eval "$(grunt --completion=bash)"

# Gulp completion
eval "$(gulp --completion=bash)"

# Initializing direnv
eval "$(direnv hook $0)"

#eval "$(ssh-agent -s)"