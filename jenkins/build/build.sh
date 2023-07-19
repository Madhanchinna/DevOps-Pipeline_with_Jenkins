#!/bin/bash

echo "************copying jar file*****************"
cp -f java-app/target/*.jar jenkins/build/

echo "**********************************************"
echo "*********Building Docker images***************"
echo "**********************************************"

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
