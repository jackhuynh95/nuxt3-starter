#!/bin/bash

set -e

# Source the environment variables
source ./scripts-pipeline/env.sh

# Variables
CUSTOM_HOST=""
CUSTOM_EMAIL=""

# SSH into the remote server and execute commands
ssh -o StrictHostKeyChecking=no -v $EC2_USER@$EC2_INSTANCE_IP << 'EOF'
  echo "Starting deployment on remote server..."

  # Login to ECR [Deprecated]
  docker login -u jackhuynh -p $PASSWORD

  # Pull the Docker image to ECR
  docker pull ${REPOSITORY_NAME}:${VERSION}

  # Stop and remove the existing container
  docker stop ${DOCKER_NAME} || true
  docker rm ${DOCKER_NAME} || true  # Ensure the container is removed

  # Run the new container
  docker run --rm -d --name ${DOCKER_NAME} -p 3000:80 ${REPOSITORY_NAME}:${VERSION} \
    --env "VIRTUAL_HOST=${CUSTOM_HOST}" \
    --env "VIRTUAL_PORT=3000" \
    --env "LETSENCRYPT_HOST=${CUSTOM_HOST}" \
    --env "LETSENCRYPT_EMAIL=${CUSTOM_EMAIL}"

  # Clean up unused resources (optional)
  # Uncomment the following line if you want to clean up after the deployment
  # docker system prune -af

  echo "Deployment to EC2 completed successfully."
EOF