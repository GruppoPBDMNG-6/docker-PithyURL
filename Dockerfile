# Pull base image.
FROM ubuntu:latest

#ports
EXPOSE 8080

#For add-apt-repository command
RUN apt-get install -y software-properties-common

# Install MongoDB
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

# Expose Mongo port 4567
EXPOSE      4567

# Run Mongo Server
ENTRYPOINT  ["/data/db"]

#Get repositories for java8
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update

#Install JDK 8
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install oracle-java8-installer -y

#Install Git
RUN apt-get install git -y 

#Install maven
RUN apt-get install maven -y

#Get the source repository
RUN git clone https://github.com/GruppoPBDMNG-6/PithyURL

#create the start server file and make it executable
RUN echo '#!/bin/bash' >> /start
RUN echo 'cd /PithyURL/PithyURL' >> /start
RUN echo 'mvn package' >> /start
RUN echo 'java -jar target/pithyurl-1.0-SNAPSHOT.jar' >> /start
RUN chmod 777 /start