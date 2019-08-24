FROM jscdroiddev/docker-openjdk:latest

LABEL maintainer="JscDroidDev"

RUN apk --no-cache add curl bash
RUN curl -Ls "https://piccolo.link/sbt-1.2.8.tgz" -o /tmp/sbt-1.2.8.tgz \
    && tar -zx -C /var/lib -f /tmp/sbt-1.2.8.tgz
RUN apk del curl

ENV SBT_HOME /var/lib/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN sbt about