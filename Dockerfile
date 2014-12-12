FROM ubuntu:14.04
MAINTAINER Florian Schrag <florian@schrag.org>

# add additional repo
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# install xvfb
RUN apt-get install -y xvfb 

ENV DISPLAY :99

# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get install -y oracle-java8-installer
  
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# delete cache
RUN rm -rf /var/cache/*
RUN rm -rf /var/lib/apt/lists/* 
  
