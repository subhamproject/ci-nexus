#!/usr/bin/env bash

TAG=$TAG
REGISTRY="${REGISTRY}"

docker build -t $REGISTRY/$TAG .
