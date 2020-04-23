FROM ubuntu:xenial
LABEL maintainer="<admin@plebdev.com>"

# Create non-root user
RUN useradd -ms /bin/bash mumble

# update app cache
RUN apt-get update

# install murmur
RUN echo "mumble-server mumble-server/password string ${SUPERUSER_PASSWORD}\nmumble-server mumble-server/start_daemon boolean true\nmumble-server mumble-server/use_capabilities boolean false" | debconf-set-selections
RUN apt-get install mumble-server -y
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure mumble-server
COPY config.ini /etc/mumble-server.ini
