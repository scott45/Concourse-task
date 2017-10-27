## Pull the mysql:5.6 image
FROM ubuntu:latest

## The maintainer name and email
MAINTAINER Businge Scott <busingescott@gmail.com>

# Install requirement (wget)
RUN \
apt-get update && \
apt-get install -y git wget sudo

## Update packages and install requirements
RUN sudo apt-get -y install python-pip python-dev build-essential libpq-dev libssl-dev
RUN sudo pip install --upgrade pip
RUN sudo pip install --upgrade virtualenv
RUN sudo pip install psycopg2

RUN mkdir app

WORKDIR /app

## clone the repo
RUN \
git clone https://github.com/scott45/checkpoint2-bucketlist.git 

## make virtualenv and install requirements
RUN \
#!/bin/bash
cd checkpoint2-bucketlist && \
virtualenv venv && \
/bin/bash -c "source venv/bin/activate" 

# Make port 80 available to the world outside this container
EXPOSE 80

# Set proxy server, replace host:port with values for your servers
ENV http_proxy host:port
ENV https_proxy host:port