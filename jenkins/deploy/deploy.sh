#!/bin/bash

echo maven > /tmp/.auth
echo $PASS >> /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth

scp -i /opt/prod.ppk /tmp/.auth kavi@18.189.189.179:/tmp/.auth
scp -i /opt/prod.ppk ./jenkins/deploy/publish kavi@18.189.189.179:/tmp/publish
ssh -i /opt/prod.ppk kavi@18.189.189.179 "/tmp/publish"
