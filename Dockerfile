FROM openjdk:11-jdk

LABEL maintainer="JscDroidDev"
ENV DEBIAN_FRONTEND noninteractive
RUN set -ex; apt-get update && apt-get -qqy upgrade && apt-get install -qqy apt-utils curl
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN set -ex; curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
RUN set -ex; apt-get update && apt-get install -qqy sbt && apt-get purge -qqy curl && apt-get -qqy autoremove --purge
