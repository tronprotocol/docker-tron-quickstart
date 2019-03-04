# Tron Quickstart

FROM ubuntu:latest
LABEL maintainer="elluck91 <lukasz@tron.network>"

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ARG DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME /usr/lib/jre

RUN mkdir /home/quickstart
WORKDIR /home/quickstart

ADD ./run_container ./run_container
ADD Nodes Nodes
ADD Eventron Eventron

# Install basic need packages
RUN apt-get update && apt-get install -y --no-install-recommends \
   gnupg2 curl ca-certificates \
   && apt-get -y autoclean

# Install JRE
RUN apt-get install -y --no-install-recommends openjdk-8-jre

# Install Redis
RUN apt-get install -y --no-install-recommends redis-server
EXPOSE 6379

# nvm environment variables
ENV NVM_DIR /root
ENV NODE_VERSION 11.10.1

# install nvm, npm, node
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
RUN source $NVM_DIR/nvm.sh 
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

RUN chmod +x ./run_container
CMD ["./run_container"]
