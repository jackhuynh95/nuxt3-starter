#!/bin/bash

set -e

# Variables
DOCKER_FILE="Dockerfile.distroless.bun"
DOCKER_NAME="affff-www"
ORGANIZATION_NAME="circle-ci" # Your organization name
REPOSITORY_NAME="${ORGANIZATION_NAME}/nois-${DOCKER_NAME}" # Updated ECR repository name

# AWS ECR URL - 659016474775.dkr.ecr.ap-southeast-2.amazonaws.com
AWS_ACCOUNT_ID="659016474775" # Your AWS account
AWS_REGION="ap-southeast-2" # Your AWS region

# Get the latest version of the Docker image
# VERSION=$(docker images ${REPOSITORY_NAME} | awk 'NR>1 {print $2}' | tail -1)
# VERSION=$(date +%Y%m%d%H%M%S)  # Using timestamp as version
VERSION="latest" # Using latest version

# Build the Docker image
# docker buildx build . -t ${REPOSITORY_NAME}:${VERSION} -f ${DOCKER_FILE} --platform linux/amd64

# Tag the image for ECR
# docker tag ${REPOSITORY_NAME}:${VERSION} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPOSITORY_NAME}:${VERSION}