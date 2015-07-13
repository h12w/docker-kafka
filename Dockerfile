FROM debian:latest
MAINTAINER Hǎiliàng Wáng <w@h12.me>

ENV VER       0.8.2.1
ENV SCALA_VER 2.10
ENV K         kafka_${SCALA_VER}-${VER}
ENV TAR       ${K}.tgz

RUN apt-get update && \
    apt-get install --yes \
        openjdk-7-jre

ADD http://mirrors.koehn.com/apache/kafka/${VER}/${TAR} .
RUN tar -xzf ${TAR} && \
    rm ${TAR} && \
    mv ${K} /opt

ADD start.sh /opt/${K}/bin/
WORKDIR /opt/${K}

EXPOSE 9092
ENTRYPOINT /opt/${K}/bin/start.sh
