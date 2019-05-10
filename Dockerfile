# create new
FROM ubuntu:18.04
MAINTAINER Rbabu <mr.vrbabu@hotmail.com>

RUN apt update
#Install prereqs i.e java8 for jenkins
RUN apt -y install openjdk-8-jdk
RUN java -version

#Add repository key to system 
RUN apt -y install wget gnupg systemd

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt update
RUN apt -y install jenkins
RUN service jenkins start
#RUN service jenkins status
RUN rm -v /var/run/jenkins/jenkins.pid
RUN service jenkins stop 
RUN service jenkins start
#RUN service jenkins status
#RUN 'cat /var/lib/jenkins/secrets/initialAdminPassword'

EXPOSE 22 8080

