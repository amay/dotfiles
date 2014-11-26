#eval `hub alias -s bash`

set -o vi

export BASH_ENV='~/.bash/env'
export EDITOR='mvim -v'
export VISUAL='mvim -v'
export TM_GIT=/usr/local/bin/git

# export CUCUMBER_FORMAT=Cucumber::Formatter::Fuubar
# export RSPEC_FORMAT=Fuubar


#complete -o default -o nospace -F __git_flow_feature f
#complete -o default -o nospace -F __git_flow_release release

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

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home"

function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
}
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

# direnv hook
eval "$(direnv hook $0)"

export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules:/usr/local/share/npm/lib/node_modules

export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.1.1
export PATH=$PATH:$EC2_HOME/bin

export NVM_DIR="/Users/alex/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
