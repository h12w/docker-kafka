FROM debian:latest
MAINTAINER Hǎiliàng Wáng <w@h12.me>

ENV VER        0.8.2.1
ENV SCALA_VER  2.10
ENV K          kafka_${SCALA_VER}-${VER}
ENV TAR        ${K}.tgz
ENV KAFKA_HOME /opt/kafka


RUN apt-get update && \
    apt-get install --yes \
        openjdk-7-jre

ADD http://mirrors.koehn.com/apache/kafka/${VER}/${TAR} .
RUN tar -xzf ${TAR} && \
    rm ${TAR} && \
    mv ${K} $KAFKA_HOME
ADD start.sh $KAFKA_HOME/bin
RUN chown -R root:root $KAFKA_HOME

RUN groupadd -r kafka \
  && useradd -c "Kafka" -d /var/lib/kafka -g kafka -M -r -s /sbin/nologin kafka \
  && mkdir /var/{lib,log}/kafka \
  && chown -R kafka:kafka /var/{lib,log}/kafka

EXPOSE 9092

VOLUME ["/var/lib/kafka"]

ENTRYPOINT ["/usr/local/sbin/start.sh"]
