#!bin/bash
set -xe

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR=$DIR/..

source "$PROJECT_DIR"/ci/internal/prepare_docker_image.sh

docker run -t --rm \
-v $PROJECT_DIR:/opt/project \
$OUR_DOCKER_REGISTRY/$DOCKER_IMAGE_NAME \
bash /opt/project/ci/internal/build.sh           
