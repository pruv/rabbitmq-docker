## RabbitMQ Dockerfile


This repository contains **Dockerfile** of [RabbitMQ](http://www.rabbitmq.com/).


### Base Docker Image

* [edplx2023.hq.target.com:5000/datastrategy/ubuntu](http://edplx2023.hq.target.com:8080/repo/tags/datastrategy%252Fubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Add repository "edplx2023.hq.target.com:5000" to existing repositories of docker installation.

3. Download: `docker pull edplx2023.hq.target.com:5000/datastrategy/rabbitmq`
    (alternatively, you can build an image from Dockerfile: `docker build")

### Usage

#### Run `rabbitmq-server`

    docker run -d -p 5672:5672 -p 15672:15672 edplx2023.hq.target.com:5000/datastrategy/rabbitmq

#### Run `rabbitmq-server` w/ persistent shared directories.

    docker run -d -p 5672:5672 -p 15672:15672 -v <log-dir>:/data/log -v <data-dir>:/data/mnesia edplx2023.hq.target.com:5000/datastrategy/rabbitmq
    access admin console at http://<hostname>:15672/
