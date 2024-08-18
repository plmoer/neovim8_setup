PATH=/bin
export PATH
PATH=/usr/bin:$PATH
PATH=/sbin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/opt/nvim-linux64/bin:$PATH
export PATH

# source /usr/share/git-completion/git-prompt.sh
# source /usr/share/git-completion/git-completion.zsh
# source /usr/share/git-completion/git-completion.tcsh
# source /usr/share/git-completion/git-completion.bash

# PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

if [ "`id -u`" -eq 0 ]; then
    PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
else
    PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
fi
export PS1

#colorize the terminal output
# alias ls='ls -G'
# alias ll='ls -lG'

 # Tell ls to be colourful
# export CLICOLOR=1
# export LSCOLORS=exfxcxdxbxegedabagacad

export ZDOTDIR=$HOME/.config/zsh
source "$HOME/.config/zsh/.zshrc"

alias vim=nvim
export EDITOR=nvim

alias python=python3

set -o vi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
