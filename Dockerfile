FROM dockerfile/java:oracle-java8
MAINTAINER Florian Schrag <florian@schrag.org>

RUN apt-get update -y
RUN apt-get install -y xvfb

ENV DISPLAY :99

# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run
