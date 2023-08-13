FROM jenkins/jenkins:jdk17

USER root

RUN groupadd -g 993 docker \
&& gpasswd -a jenkins docker

USER jenkins