#!/usr/bin/env bash
set -x
mvn jar:jar install:install help:evaluate -Dexpression=project.name

NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`

GIT_COMMIT_SHA=$(git rev-parse --short HEAD)
JAR_FILE_NAME="$NAME-$VERSION.jar"
JAR_FILE_PATH="$PWD/target/$JAR_FILE_NAME"
REPO="docker.tartismaliyiz.com"

IMAGE_TAG="$REPO/$NAME:$VERSION-$GIT_COMMIT_SHA"
docker build -t $IMAGE_TAG --build-arg JAR_FILE_NAME=$JAR_FILE_NAME .
echo $DOCKER_REPO_PASSWORD | docker login --username $DOCKER_REPO_USERNAME --password-stdin $REPO
docker push $IMAGE_TAG
helm install --set image.repository="$REPO/$NAME" --set image.tag="$VERSION-$GIT_COMMIT_SHA" ./helm/sample-java-app
