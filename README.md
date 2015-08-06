Dockerfile of Kafka for Unit Testing
====================================

```bash
docker run --detach=true \
           --publish=9092:9092 \
	   --env=KAFKA_DELETE_TOPIC_ENABLE=true \
	   --env=KAFKA_BROKER_ID=1 \
	   --env=KAFKA_ADVERTISED_HOST_NAME=r`boot2docker ip` \
	   --env=KAFKA_ZOOKEEPER_CONNECT=`boot2docker ip` \
	   h12w/kafka
```
