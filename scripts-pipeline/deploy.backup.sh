#!/bin/bash

set -e

# Variables
DOCKER_FILE="Dockerfile.distroless.bun"
DOCKER_NAME="nuxt-starter"
ORGANIZATION_NAME="jackhuynh" # Your organization name
REPOSITORY_NAME="${ORGANIZATION_NAME}/${DOCKER_NAME}" # Updated ECR repository name

# Get the latest version of the Docker image
# VERSION=$(docker images ${REPOSITORY_NAME} | awk 'NR>1 {print $2}' | tail -1)
# VERSION=$(date +%Y%m%d%H%M%S)  # Using timestamp as version
VERSION="latest" # Using latest version

CUSTOM_HOST=""
CUSTOM_EMAIL=""

# Login to ECR [Deprecated]
docker login -u jackhuynh -p $PASSWORD

# Pull the Docker image to ECR
docker pull ${REPOSITORY_NAME}:${VERSION}

# Run docker system prune to clean up unused resources
# docker system prune -af (Open this line to clean up unused resources)

# Stop and remove the existing container
docker stop ${DOCKER_NAME} || true
# docker image rm ${DOCKER_NAME} || true (Open this line to clean up this image)

# Run the new container
# docker run --rm -d --name ${DOCKER_NAME} -p 3000:80 ${REPOSITORY_NAME}:${VERSION}
docker run --rm -d --name ${DOCKER_NAME} -p 3000:80 ${REPOSITORY_NAME}:${VERSION} \
  --env "VIRTUAL_HOST=${CUSTOM_HOST}" \
  --env "VIRTUAL_PORT=3000" \
  --env "LETSENCRYPT_HOST=${CUSTOM_HOST}" \
  --env "LETSENCRYPT_EMAIL=${CUSTOM_EMAIL}"

echo "Deployment to EC2 completed successfully."