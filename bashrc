eval `hub alias -s bash`

set -o vi

export BASH_ENV='~/.bash_env'
export EDITOR='mvim -v'
export VISUAL='mvim -v'
export TM_GIT=/usr/local/bin/git

export CUCUMBER_FORMAT=Cucumber::Formatter::Fuubar
export RSPEC_FORMAT=Fuubar

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/share/npm/bin:~/.bin:$PATH:$HOME/.rvm/bin
export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules

#complete -o default -o nospace -F __git_flow_feature f
#complete -o default -o nospace -F __git_flow_release release

source ~/.bashcolors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

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

source ~/.bashaliases
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion