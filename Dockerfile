FROM phusion/baseimage:0.9.14
MAINTAINER Michael Riedmann <michael_riedmann@live.com>

# Basic Ubuntu-Env
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

# Update Apt-Get
RUN apt-get -y update
