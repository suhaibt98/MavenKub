
#!/bin/bash

set -ex

LAST_COMMIT_DATE=$(git log -1 --format=%cd --date=format:'%y%m%d')
COMMIT_HASH=$(git rev-parse --short=8 HEAD)
IMAGE_TAG="$LAST_COMMIT_DATE-$COMMIT_HASH"

echo "IMAGE_TAG = $IMAGE_TAG"
# Build the Docker image with the dynamic image tag
echo "Building Docker image with tag: $IMAGE_TAG"
docker build -t my-application:$IMAGE_TAG .

# Check if the image was successfully built
if [[ "$(docker images -q my-application:$IMAGE_TAG 2> /dev/null)" == "" ]]; then
  echo "ERROR: Failed to build Docker image with tag $IMAGE_TAG"
  exit 1
fi

echo "Starting Docker container with tag: $IMAGE_TAG"
docker run -p 9090:8080 -e SPRING_PROFILES_ACTIVE=h2 -e JAVA_OPTS='-Xmx512m' my-application:$IMAGE_TAG

