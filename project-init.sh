#!/bin/bash

git_talend=https://github.com/Talend/
git_tag=none

function tgits () {
  if [ -e $1 ]; then
    pushd $1
      git pull origin master
    popd
  else
    git submodule add ${git_talend}$1.git
  fi

  if [ -n "$2" ]; then
    if [ "none" == "$2" ]; then
      echo -e "" # nop
    elif [ "reset" == "$2" ]; then
      git reset --hard
      git checkout -
    else
      git reset --hard
      git checkout refs/tags/$2
    fi
  fi
}

tgits studio-se-master ${git_tag}
tgits tbd-studio-se ${git_tag}
tgits tcommon-studio-se ${git_tag}
tgits tdi-studio-se ${git_tag}
tgits tdq-studio-se ${git_tag}
tgits tesb-studio-se ${git_tag}
tgits tmdm-studio-se ${git_tag}
# tgits toem-studio-se ${git_tag}
tgits tmdm-common ${git_tag}
