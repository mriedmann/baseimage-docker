FROM phusion/baseimage:0.9.14
MAINTAINER Michael Riedmann <michael_riedmann@live.com>

# Basic Ubuntu-Env
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

# Update Apt-Get
RUN apt-get -y update

# Install CONFD
RUN wget https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 && \
    mv confd /usr/local/bin/confd && \
    chmod +x /usr/local/bin/confd && \
    mkdir -p /etc/confd/{conf.d,templates} && \
    mkdir /etc/service/confd

# Add CONFD Config
ADD 00-confd run_confd.sh
