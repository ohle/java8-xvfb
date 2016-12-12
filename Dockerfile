FROM openjdk:8-alpine
MAINTAINER Florian Schrag <florian@schrag.org>

# add additional repo
RUN apk update -q && apk add --no-cache xvfb

ENV DISPLAY :99

ADD xvfb-daemon-run /usr/bin/xvfb-run
RUN chmod a+x /usr/bin/xvfb-run
RUN ln -s /usr/bin/xvfb-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

ENTRYPOINT ["xvfb-run"]
