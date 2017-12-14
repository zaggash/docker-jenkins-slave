#!/usr/bin/env sh
set -e

LABELS="${LABELS:-docker}"
EXECUTORS="${EXECUTORS:-3}"
FSROOT="${FSROOT:-/tmp/jenkins}"
MASTER="${MASTER:-http://jenkins-master:8080}"

mkdir -p $FSROOT
java -jar swarm-client.jar -labels="$LABELS" -executors="$EXECUTORS" -fsroot="$FSROOT" -name=docker-$(hostname) -master "$MASTER" $(cat /run/secrets/jenkins)
