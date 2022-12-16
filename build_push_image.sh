#! /bin/bash

# build image make sure docker file in current directory
echo "Build the image"
docker build -t item-app:v1 .

# list images
echo "List docker image"
docker images

# tag item app image
echo "Tag item-app image to ghcr.io/vikraam27/item-app:v1"
docker tag item-app:v1 ghcr.io/vikraam27/item-app:v1

# login to github
echo "Login to github"
echo $GITHUB_PWD | docker login ghcr.io -u vikraam27 --password-stdin

# push the image
echo "Pushing to github package"
docker push ghcr.io/vikraam27/item-app:v1