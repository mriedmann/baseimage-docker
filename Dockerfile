FROM phusion/baseimage:0.9.14
MAINTAINER Michael Riedmann <michael_riedmann@live.com>

# Basic Ubuntu-Env
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

# Update Apt-Get
RUN apt-get -y update

# Install Basics
RUN apt-get -y install wget curl

# Install CONFD
RUN wget -O confd https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 && \
    mv confd /usr/local/bin/confd && \
    chmod +x /usr/local/bin/confd 
	
# Create CONFD dirs
RUN mkdir -p /etc/confd/conf.d && \
	mkdir -p /etc/confd/templates && \
    mkdir /etc/service/confd

# Add CONFD Init-Script
ADD init_confd.sh /etc/my_init.d/00-confd

# Add CONFD Run-Script
ADD run_confd.sh /etc/service/confd/run

# Add CONFD Config
ADD confd/*.tmpl /etc/confd/templates/
ADD confd/*.toml /etc/confd/conf.d/
