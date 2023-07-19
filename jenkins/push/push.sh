#!/bin/bash

echo "********************************"
echo "*****Docker pushing image*******"
echo "********************************"

echo "********Docker loging***********"

# maven is my repo name madhanchinna/maven
IMAGE="maven"

docker login -u madhanchinna -p $PASS

echo "**********Taging***********"
docker tag $IMAGE:$BUILD_TAG madhanchinna/$IMAGE:$BUILD_TAG

echo "**********Pushing docker image***********"

docker push madhanchinna/$IMAGE:$BUILD_TAG