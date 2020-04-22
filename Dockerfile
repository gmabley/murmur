FROM ubuntu:bionic
LABEL maintainer="<admin@plebdev.com>"

# Define environment variables
ENV CONFIG_PATH=/etc/mumble/config.ini

# Create Mumble directories
RUN mkdir -pv /opt/mumble /etc/mumble

# Create non-root user
RUN useradd -ms /bin/bash mumble

# Copy config file
COPY config.ini /etc/mumble/config.ini

# Copy run script
COPY run.sh /opt/mumble/run.sh

# update app cache
RUN sudo apt-get update

# install murmur
RUN sudo apt-get install mumble-server

# config murmur
RUN sudo dpkg-reconfigure mumble-server