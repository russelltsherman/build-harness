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
    ref=$(echo "$url" | awk -F '/?ref=/' '{print $2}')
    url=$(echo "$url" | awk -F '/?ref=/' '{print $1}')
    action "clone $url"
    git clone --recurse-submodules "$url" "$directory" #> /dev/null 2>&1
    [ "$ref" = "" ] || (
      action "checkout $ref"
      cd "$directory" && git checkout "$ref" || exit
    )
  fi
}

# regex that covers most valid git repo formats
# /((git|ssh|http(s)?)|(git@[\w\.]+))(:(\/\/)?)([\w\.@\:\/\-~]+)(\.git)(\/)?/gm

# covered by regex
# ssh://user@host.xz:port/path/to/repo.git/
# ssh://user@host.xz/path/to/repo.git/
# ssh://host.xz:port/path/to/repo.git/
# ssh://host.xz/path/to/repo.git/
# ssh://user@host.xz/path/to/repo.git/
# ssh://host.xz/path/to/repo.git/
# ssh://user@host.xz/~user/path/to/repo.git/
# ssh://host.xz/~user/path/to/repo.git/
# ssh://user@host.xz/~/path/to/repo.git
# ssh://host.xz/~/path/to/repo.git
# git://host.xz/path/to/repo.git/
# git://host.xz/~user/path/to/repo.git/
# http://host.xz/path/to/repo.git/
# https://host.xz/path/to/repo.git/

# not covered by regex
# user@host.xz:/path/to/repo.git/
# host.xz:/path/to/repo.git/
# user@host.xz:~user/path/to/repo.git/
# host.xz:~user/path/to/repo.git/
# user@host.xz:path/to/repo.git
# host.xz:path/to/repo.git
# rsync://host.xz/path/to/repo.git/
# /path/to/repo.git/
# path/to/repo.git/
# ~/path/to/repo.git
# file:///path/to/repo.git/
# file://~/path/to/repo.git/
