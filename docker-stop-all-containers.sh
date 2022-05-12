#!/bin/bash
set -e
DOCKER_CONTAINERS=$(docker ps -q)
if [[ ! -z ${DOCKER_CONTAINERS} ]]; then
    docker stop ${DOCKER_CONTAINERS}
fi
