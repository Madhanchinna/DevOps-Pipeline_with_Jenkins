FROM jenkins/jenkins

USER root

RUN apt-get update && \
    apt-get install -y python3-pip

RUN pip install -U ansible

# Install Docker

RUN apt-get update &&\
    apt-get install -y ca-certificates curl gnupg apt-transport-https software-properties-common

RUN install -m 0755 -d /etc/apt/keyrings && \
   curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
   chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
RUN echo \
    "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

 RUN     apt-get update && \
      apt-get -y install docker-ce

# COmpose

RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins
