#!/usr/bin/env bash

git_clone_or_update() {
  if [ -d "$2/.git" ]; then
    action "update $1 master branch"
    ( cd "$2" || exit; git checkout master && git pull origin master && git submodule update --recursive > /dev/null 2>&1 )
    if git branch -a | egrep 'remotes/origin/develop'; then
      action "update $1 develop branch"
      ( cd "$2" || exit; git checkout develop && git pull origin develop && git submodule update --recursive > /dev/null 2>&1 )
    fi
  else
    action "clone $1"
    git clone --recurse-submodules "$1" "$2" > /dev/null 2>&1
  fi
}
