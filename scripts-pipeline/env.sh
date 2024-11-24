#!/bin/bash

# Environment Variables
export DOCKER_NAME="nuxt-starter"
export ORGANIZATION_NAME="jackhuynh" # Your organization name
export REPOSITORY_NAME="${ORGANIZATION_NAME}/${DOCKER_NAME}" # Updated Docker Hub repository name

# Generate version based on semantic versioning
# This could be read from a VERSION file or set manually
PREFIX_VERSION="1.0.0"  # Update this as needed for your releases

# Optionally, append a timestamp for uniqueness
SUFFIX_TIMESTAMP=$(date +%Y%m%d%H%M%S)

export VERSION="${PREFIX_VERSION}-${SUFFIX_TIMESTAMP}"
