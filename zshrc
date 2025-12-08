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

# if [ "`id -u`" -eq 0 ]; then
#     PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
# else
#     PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
# fi
# export PS1

# --- Modern Color Configuration (Dracula-inspired) ---
# We define colors using tput or ANSI codes for better readability
RESET="\[\033[0m\]"
BOLD="\[\033[1m\]"

# Palette
CYAN="\[\033[1;36m\]"
GREEN="\[\033[1;32m\]"
PURPLE="\[\033[1;35m\]"
RED="\[\033[1;31m\]"
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[1;34m\]"
WHITE="\[\033[1;37m\]"

# Define symbols
ARROW="➜"  # A modern replacement for ">"
SEP="|"    # Separator

# --- Logic ---

if [ "$(id -u)" -eq 0 ]; then
    # ROOT USER PROMPT (Red Alert theme)
    # Style: | TIME | ROOT @ HOSTNAME : [ DIR ] ➜
    USER_COLOR="$RED"
    USER_NAME="\u" # Standard username
else
    # NORMAL USER PROMPT (Cool Green/Blue theme)
    # Style: | TIME | USER @ HOSTNAME : [ DIR ] ➜
    USER_COLOR="$GREEN"
    USER_NAME="\u"
fi

# Build the PS1 string
# 1. Time in Purple
# 2. Separators in dimmed White
# 3. User@Host in UserColor (Red/Green) and Cyan
# 4. Directory in Blue (standard for folders)
# 5. Prompt arrow in Bold Yellow
PS1="${WHITE}${SEP}${PURPLE}\t${WHITE}${SEP}${USER_COLOR}${USER_NAME}${WHITE}@${CYAN}\h${WHITE}:${BLUE}[\W]${YELLOW} ${ARROW} ${RESET}"

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
