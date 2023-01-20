#! /bin/bash

# build image make sure docker file in current directory
echo "Build the image"
docker build -t karsajobs:latest .

# list images
echo "List docker image"
docker images

# tag item app image
echo "Tag item-app image to ghcr.io/vikraam27/karsajobs:latest"
docker tag karsajobs:latest ghcr.io/vikraam27/karsajobs:latest

export GITHUB_PWD=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

# login to github
echo "Login to github"
echo $GITHUB_PWD 
echo $GITHUB_PWD | docker login ghcr.io -u vikraam27 --password-stdin

# push the image
echo "Pushing to github package"
docker push ghcr.io/vikraam27/karsajobs:latest
