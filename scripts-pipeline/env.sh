#!/bin/bash

# Environment Variables
export DOCKER_NAME="nuxt-starter"
export ORGANIZATION_NAME="jackhuynh" # Your organization name
export REPOSITORY_NAME="${ORGANIZATION_NAME}/${DOCKER_NAME}" # Updated Docker Hub repository name

# Get the latest version of the Docker image
VERSION=$(docker images ${REPOSITORY_NAME} | awk 'NR>1 {print $2}' | tail -1)
# VERSION=$(date +%Y%m%d%H%M%S)  # Using timestamp as version
# VERSION="latest" # Using latest version