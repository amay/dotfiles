export BASH_ENV='~/.bash/env'
export EDITOR='code --wait'
export VISUAL='code --wait'
export TM_GIT=/usr/local/bin/git

source ~/.bash/colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# if [ -f `brew --prefix`/etc/bash_completion ]; then
#   . `brew --prefix`/etc/bash_completion
# fi

# git bash completion with 'g' alias
__git_complete g __git_main


export HOMEBREW_TEMP=/var/tmp
export BUNDLER_EDITOR='code --wait'

# git prompt goodnes
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=verbose
PS1="${COLOR_RED}[${COLOR_WHITE}\t ${COLOR_NONE}\W${COLOR_GREEN}\$(__git_ps1 ' (%s)')${COLOR_RED}]${COLOR_NONE}\$ "
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
function name_tab() {
  echo -ne "\033]0;$1\007"
}

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

source ~/.bash/aliases

# Enter bracketed paste mode, see .inputrc for how to ignore it in bash
[ -n "$ITERM_PROFILE" ] && printf "\e[?2004h"

[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
[ -f ~/.asdf/completions/asdf.bash ] && source ~/.asdf/completions/asdf.bash

export ANDROID_HOME=/usr/local/opt/android-sdk

export JAVA_HOME="$(/usr/libexec/java_home)"

# direnv hook
eval "$(direnv hook $0)"


