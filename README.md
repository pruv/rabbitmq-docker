## RabbitMQ Dockerfile


This repository contains **Dockerfile** of [RabbitMQ](http://www.rabbitmq.com/).


### Base Docker Image

* dockerfile/ubuntu


### Installation

1. Install [Docker](https://www.docker.com/).
2. Build an image from Dockerfile: `docker build")

### Usage

#### Run `rabbitmq-server`

    docker run -d -p 5672:5672 -p 15672:15672 <imageId>

#### Run `rabbitmq-server` w/ persistent shared directories.

    docker run -d -p 5672:5672 -p 15672:15672 -v <log-dir>:/data/log -v <data-dir>:/data/mnesia <imageId>
    access admin console at http://<hostname>:15672/
