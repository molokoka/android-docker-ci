#!bin/bash
set -xe

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR=$DIR/../..

$PROJECT_DIR/./gradlew -p $PROJECT_DIR --no-daemon assembleDebug
