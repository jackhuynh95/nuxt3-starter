#!/bin/bash

set -e

# Source the environment variables
source ./scripts-pipeline/env.sh

# Variables
DOCKER_FILE="Dockerfile.distroless.bun"

# Login to ECR [Deprecated]
docker login -u jackhuynh -p $PASSWORD

# Build the Docker image
docker buildx build . -t ${REPOSITORY_NAME}:${VERSION} -f ${DOCKER_FILE} --platform linux/amd64

# Tag the image for ECR
docker tag ${REPOSITORY_NAME}:${VERSION} ${REPOSITORY_NAME}:${VERSION}

# Push the Docker image to ECR
docker push ${REPOSITORY_NAME}:${VERSION}

echo "Push Docker image to ECR completed successfully."