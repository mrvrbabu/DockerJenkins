# DockerJenkins

# Run the jenkins-docker.sh to install jenkins as docker image

# Run docker exec -it <container id> /bin/cat /var/jenkins_home/secrets/initialAdminPassword  # To get the jenkins initial adim password. 

# Docker image build command 
 docker build -t ubuntudockerjenkins . 
 docker run -it -p 8080:8080 --name=jenkins01 ubuntudockerjenkins

# Jenkins is failing to restart when we start the container, for now login to container and manually start the jenkins service "service jenkins start"

# Jenkins notes

What is Jenkins
* Jenkins is an opensource continuous integration (CI) and continuous Delivery (CD) tool written in Java
* It's an automation server used to build and deliver software projects.

Build --> Deploy -> Test ---------------> Release ----> Provison servers ---- > Customers
                    Unit Test             Package       Deploy
                    Integration Test
                    Regression Test
                    User Acceptence Test



jenkins installation
Jenkins alternatives

Self-Hosted
  * Drone CI (continuous delivery platform written in Go)
  * TeamCity ( by Jetbrains)

Hosted (as a service)
  * Wercker
  * CircleCI
  * CodeShip

On Ubuntu

Pre req
https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04#installing-specific-versions-of-openjdk
* Java version 8
apt install openjdk-8-jdk
java -version

*If Other version of java is installed, change to java8
update-alternatives --config java



*Installation
https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-18-04

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update
apt install jenkins
systemctl start jenkins
systemctl status jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword

java -jar jenkins.war --httpPort=9090 (to start jenkins on non-standard port, default port 8080)

*While managing plugins if you see "there were errors checking the update sites sslhandshakeexception"
Solution - change the url from "https://updates.jenkins.io/update-center.json" to "http://updates.jenkins.io/update-center.json"
Manage Jenkins -> Manage plugins -> Plugin Manager -> Advanced

https://www.youtube.com/watch?v=QvFungzXI5s&list=PLhW3qG5bs-L_ZCOA4zNPSoGbnVQ-rp_dG&index=5
* Managing using commandline
* goto http://192.168.56.106:8080/cli/
* Download http://192.168.56.106:8080/jnlpJars/jenkins-cli.jar

Roles strategy plugins ( to manage users and assign roles)

https://www.youtube.com/watch?v=QvFungzXI5s&list=PLhW3qG5bs-L_ZCOA4zNPSoGbnVQ-rp_dG&index=5
Steps
Install the Roles strategy plugins
Enable security and set role-based strategy under configure global security

Global configurations

Refer to global environment variables using ${key1}, $key1, etc.

For tomcat build deploy permission error

root@jenkinsserver:/opt/tomcat/webapps/manager/META-INF# cat context.xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<Context antiResourceLocking="false" privileged="true" >
	<!--
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
   -->
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
</Context>
root@jenkinsserver:/opt/tomcat/webapps/manager/META-INF#



https://www.youtube.com/watch?v=bGqS0f4Utn4&list=PLhW3qG5bs-L_ZCOA4zNPSoGbnVQ-rp_dG&index=8
Jenkins integration with GIT (SCM)

Step 1: Create a java program


Delivery pipeline plugin
Build Pipeline plugin

Java code
Hello.java
public class Hello{
  public static void main(String[] args){
    for(int i=1;i<=10;i++){
      System.out.println("Hello World...." +i);
    }
  }

}

