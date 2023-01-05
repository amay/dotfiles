function current_branch {
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
    branch_name="(unnamed branch)"     # detached HEAD

  echo ${branch_name##refs/heads/}
}
