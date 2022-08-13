FROM jenkins/jenkins:2.346.3-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins


VOLUME /var/jenkins_home

## Docker build 
# sudo docker build -t jenkins .

## Docker run 
# sudo docker run -it -d -p 8080:8080 --name jenkins jenkins


## Run below command to get the username and password
#sudo docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
