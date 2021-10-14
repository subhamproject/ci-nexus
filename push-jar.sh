#!/usr/bin/env bash

export NEXUS_USER=$NEXUS_USER
export NEXUS_PASS=$NEXUS_PASS
export NEXUS_REPO=$NEXUS_REPO

mvn -U -s settings.xml -Dmaven.package.skip=true -Dmaven.test.skip=true -Dmaven.compile.skip=true deploy
