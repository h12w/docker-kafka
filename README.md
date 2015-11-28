Dockerfile of Kafka for Unit Testing
====================================

Kafka 0.9.0.0

```bash
docker run --detach=true \
           --publish=9092:9092 \
	   --env=KAFKA_DELETE_TOPIC_ENABLE=true \
	   --env=KAFKA_ADVERTISED_HOST_NAME=`boot2docker ip` \
	   h12w/kafka
```
