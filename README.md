Dockerfile of Kafka for Unit Testing
====================================

Mac OSX:

```bash
docker run -d -p 9092:9092 --env=ADVERTISED_HOST=`boot2docker ip` h12w/kafka
```

Linux:

```bash
docker run -d -p [port]:[port] h12w/kafka
```
