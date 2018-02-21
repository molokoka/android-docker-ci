#!/bin/bash
set -xe

# You can run it from any directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
PROJECT_DIR=$DIR/../..

DOCKER_IMAGE_NAME=`cat "$PROJECT_DIR"/ci/docker/docker-image.name`
OUR_DOCKER_REGISTRY="molokoka"

if docker pull $OUR_DOCKER_REGISTRY/$DOCKER_IMAGE_NAME ; then
    echo "Docker image with same tag already exists in docker registry $OUR_DOCKER_REGISTRY"
    echo "Skipping build step of the image"
else
    echo "Building docker image"
    docker build -t $DOCKER_IMAGE_NAME $PROJECT_DIR/ci/docker/
    docker tag $DOCKER_IMAGE_NAME $OUR_DOCKER_REGISTRY/$DOCKER_IMAGE_NAME
    docker push $OUR_DOCKER_REGISTRY/$DOCKER_IMAGE_NAME
fi
