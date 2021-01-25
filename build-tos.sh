#!/bin/bash

export MAVEN_OPTS='-Xmx8000m -XX:-UseConcMarkSweepGC'

if [ ! -e ../logs ]; then
  mkdir ../logs
fi

pushd studio-se-master
  pushd talend.studio.parent.pom
    mvn clean install
  popd
  mvn clean
  mvn install -Dtos.bd=false -Dtos.di=true -Dtos.dq=false -Dtos.esb=false --log-file ../logs/build-tdi.log
  mvn install -Dtos.bd=false -Dtos.di=false -Dtos.dq=true -Dtos.esb=false --log-file ../logs/build-tdq.log
  mvn install -Dtos.bd=true -Dtos.di=false -Dtos.dq=false -Dtos.esb=false --log-file ../logs/build-tbd.log
  mvn install -Dtos.bd=false -Dtos.di=false -Dtos.dq=false -Dtos.esb=true --log-file ../logs/build-tesb.log
popd
