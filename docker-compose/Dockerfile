FROM jenkins/jenkins:jdk17

USER root

RUN apt-get update  -qq \
    && apt-get install docker-ce -y
RUN usermod -aG docker jenkins
RUN apt-get clean

# RUN groupadd -g 993 docker \
# && gpasswd -a root docker


