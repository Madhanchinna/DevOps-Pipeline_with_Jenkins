#!/bin/bash

echo maven > /tmp/.auth
echo $PASS >> /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth

scp -i /opt/prod.ppk /tmp/.auth <remote_user>@<remote_machine_IP>:/tmp/.auth
scp -i /opt/prod.ppk ./jenkins/deploy/publish <remote_user>@<remote_machine_IP>:/tmp/publish
ssh -i /opt/prod.ppk <remote_user>@<remote_machine_IP> "/tmp/publish"
