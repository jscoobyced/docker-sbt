FROM jscdroiddev/docker-openjdk:latest

LABEL maintainer="JscDroidDev"

ENV SBT_VERSION 1.2.8

RUN apk --no-cache add curl bash
RUN curl -Ls "https://piccolo.link/sbt-${SBT_VERSION}.tgz" -o /tmp/sbt-${SBT_VERSION}.tgz \
    && tar -zx -C /var/lib -f /tmp/sbt-${SBT_VERSION}.tgz
RUN apk del curl

ENV SBT_HOME /var/lib/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN sbt about