FROM java:8-jdk
MAINTAINER Florian Schrag <florian@schrag.org>

# add additional repo
RUN apt-get update && apt-get install -y xvfb libxrender1 libxtst6 libxi6

ENV DISPLAY :99

# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

# delete cache
RUN rm -rf /var/cache/*
RUN rm -rf /var/lib/apt/lists/* 
  
