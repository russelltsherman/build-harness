#!/usr/bin/env bash

git_update_branch() {
  local branch="$1"
  set +e
  if git branch -a | egrep "remotes/origin/$branch"
  then
    action "update $branch branch"
    git checkout "$branch" && \
    git pull origin "$branch" && \
    git submodule update --recursive #> /dev/null 2>&1
  fi
  set -e
}

git_clone_or_update() {
  local url="$1"
  local directory="$2"

  if [ -d "$directory/.git" ]
  then
    ( 
      cd "$directory" || exit; 
      git_update_branch "main"
      git_update_branch "master"
      git_update_branch "develop"
    )
  else
    action "clone $1"
    git clone --recurse-submodules "$url" "$directory" #> /dev/null 2>&1
  fi
}
