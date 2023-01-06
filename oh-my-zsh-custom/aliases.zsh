alias mkdir='mkdir -p'

alias du='du -kh'
alias df='df -kTh'

alias ack='ag'
alias which='type -a'

# hide/unhide hidden files/folders
alias show="defaults write com.apple.Finder AppleShowAllFiles YES; killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles  NO; killall Finder"

alias ssh='TERM=xterm-256color ssh'
alias tmux='tmux -2'

# function current_branch {
#   branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
#     branch_name="(unnamed branch)"     # detached HEAD

#   echo ${branch_name##refs/heads/}
# }

# unalias g 2>/dev/null
# function g {
#   if [[ $# > 0 ]]; then
#     git "$@"
#   else
#     git status -sb
#   fi
# }

function _gs() { alias | grep "^g.*$1" }
