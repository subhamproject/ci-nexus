#!/usr/bin/env bash

export NEXUS_USER=$NEXUS_USER
export NEXUS_PASS=$NEXUS_PASS
export NEXUS_REPO=$NEXUS_REPO


mvn clean package
