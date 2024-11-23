#!/bin/bash

set -e

# Variables
DOCKER_FILE="Dockerfile.alpine"
DOCKER_NAME="nuxt-starter"
ORGANIZATION_NAME="jackhuynh" # Your organization name
REPOSITORY_NAME="${ORGANIZATION_NAME}/${DOCKER_NAME}" # Updated ECR repository name

# Get the latest version of the Docker image
# VERSION=$(docker images ${REPOSITORY_NAME} | awk 'NR>1 {print $2}' | tail -1)
# VERSION=$(date +%Y%m%d%H%M%S)  # Using timestamp as version
VERSION="latest" # Using latest version

# Login to ECR [Deprecated]
docker login -u jackhuynh -p $PASSWORD

# Build the Docker image
docker buildx build . -t ${REPOSITORY_NAME}:${VERSION} -f ${DOCKER_FILE} --platform linux/amd64

# Tag the image for ECR
docker tag ${REPOSITORY_NAME}:${VERSION}

# Push the Docker image to ECR
docker push ${REPOSITORY_NAME}:${VERSION}

echo "Push Docker image to ECR completed successfully."