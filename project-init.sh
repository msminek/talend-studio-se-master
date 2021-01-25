#!/bin/bash

git_talend=https://github.com/Talend/

if [ -z "$1" ]; then
  git_tag=none
else
  git_tag=$1
fi

function tgits () {
  echo "* start tgits($1, $2)"
  if [ -e $1 ]; then
    pushd $1
      git fetch --all --tags
    popd
  else
    git submodule add ${git_talend}$1.git
  fi

  if [ -n "$2" ]; then
    if [ "none" == "$2" ]; then
      echo -e "" # nop
    elif [ "reset" == "$2" ]; then
      echo "* checkout -"
      pushd $1
        git reset --hard
        git checkout -
      popd
    else
      echo "* checkout $2"
      pushd $1
        git checkout tags/$2
        if [ $? != 0 ]; then
          git tag -l 'release/*'
        fi
      popd
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
