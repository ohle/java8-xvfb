FROM dockerfile/java:oracle-java8
MAINTAINER Florian Schrag <florian@schrag.org>

RUN apt-get update -y
RUN apt-get install -y xvfb
