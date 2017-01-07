#
# RabbitMQ Dockerfile
#

# Pull base image.
FROM edplx2023.hq.target.com:5000/datastrategy/ubuntu

# Add files.
ADD bin/rabbitmq-start /usr/local/bin/

# Install RabbitMQ.
RUN apt-get update && \
 apt-get install -y wget && \
 rm -rf /var/lib/apt/lists/* && \
 wget -qO - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add - && \
 echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list && \
 sudo apt-get update && \
 sudo apt-cache search rabbitmq-server && \
 apt-get --yes --force-yes install -y rabbitmq-server && \
 rm -rf /var/lib/apt/lists/* && \
 rabbitmq-plugins enable rabbitmq_management && \
 echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config && \
 chmod +x /usr/local/bin/rabbitmq-start

# Define environment variables.
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

# Define mount points.
VOLUME ["/data/log", "/data/mnesia"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["rabbitmq-start"]

# Expose ports.
EXPOSE 5672
EXPOSE 15672
