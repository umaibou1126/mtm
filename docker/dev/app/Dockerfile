FROM debian
FROM ruby:2.7.1
FROM nginx:1.15.8
FROM mysql:5.7

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

RUN touch /var/log/mysql/mysqld.log
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN mkdir -p tmp/sockets



# RUN rm -f /etc/nginx/conf.d/*
# ADD nginx/nginx.conf /etc/nginx/conf.d/app.conf
# CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
