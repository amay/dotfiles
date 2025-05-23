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

alias gbdcomp='git branch --no-color | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command grep -i "comp-" | command xargs git branch -D 2>/dev/null'
alias gcam='git commit --amend'
alias gcleanup=git_remove_squash_merged_local_branch
alias gdc='git diff --diff-filter=U --name-only'
alias grbur='grb --update-refs'
alias grbomur='grbom --update-refs'

function git_remove_squash_merged_local_branch() {
  git fetch --prune -q
  git checkout -q master &&
    git for-each-ref refs/heads/ "--format=%(refname:short)" |
    while read branch; do
      ancestor=$(git merge-base master $branch) &&
        [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $ancestor -m _)) == "-"* ]] &&
        git branch -D $branch
    done
}

# Check if main exists and use instead of master
# copied from .oh-my-zsh/plugins/git/git.plugin.zsh to avoid using default
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}


alias lg='lazygit'
