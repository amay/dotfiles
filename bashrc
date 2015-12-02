export BASH_ENV='~/.bash/env'
export EDITOR='mvim -v'
export VISUAL='mvim -v'
export TM_GIT=/usr/local/bin/git

source ~/.bash/colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# setup resty
. ~/.bash/resty

export HOMEBREW_TEMP=/var/tmp
export BUNDLER_EDITOR='/usr/local/bin/mvim -v'

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
if [ -f `brew --prefix`/etc/autojump.sh ]; then
  . `brew --prefix`/etc/autojump.sh
fi

# Enter bracketed paste mode, see .inputrc for how to ignore it in bash
[ -n "$ITERM_PROFILE" ] && printf "\e[?2004h"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion


if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  . /usr/local/bin/virtualenvwrapper.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

export ANDROID_HOME="/usr/local/Cellar/android-sdk/r21/"

export JAVA_HOME="$(/usr/libexec/java_home)"

# direnv hook
eval "$(direnv hook $0)"

export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules:/usr/local/share/npm/lib/node_modules

export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.1.1
export PATH=$PATH:$EC2_HOME/bin

export NVM_DIR="/Users/alex/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
