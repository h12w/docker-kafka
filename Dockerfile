FROM h12w/jre:latest
MAINTAINER Hǎiliàng Wáng <w@h12.me>

# ADD http://mirrors.163.com/.help/sources.list.jessie /etc/apt/sources.list

RUN apt-get update && \
    apt-get install --yes curl \
                          jq \
			  docker.io \
			  net-tools

ENV VER        0.8.2.2
ENV SCALA_VER  2.10
ENV K          kafka_${SCALA_VER}-${VER}
ENV TAR        ${K}.tgz
ENV KAFKA_HOME /opt/kafka

RUN mirror=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred') && \
    curl -o /tmp/$TAR -L ${mirror}kafka/$VER/$TAR


RUN tar -xzf /tmp/${TAR} && \
    mv ${K} $KAFKA_HOME

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/kafka"]
EXPOSE 9092
ADD start.sh /usr/bin/start.sh
CMD start.sh
