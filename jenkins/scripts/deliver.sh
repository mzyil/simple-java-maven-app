#!/usr/bin/env bash
set -x
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`

GIT_COMMIT_SHA=$(git rev-parse --short HEAD)
JAR_FILE_NAME="$NAME-$VERSION.jar"
JAR_FILE_PATH="$PWD/target/$JAR_FILE_NAME"
PASSWORD="Mzyil."
REPO="docker.tartismaliyiz.com"
USERNAME="mzyil"

IMAGE_TAG="$REPO/$NAME:$VERSION-$GIT_COMMIT_SHA"
docker build -t $IMAGE_TAG --build-arg JAR_FILE_NAME=$JAR_FILE_NAME .
echo $PASSWORD | docker login --username $USERNAME --password-stdin $REPO
docker push $IMAGE_TAG
