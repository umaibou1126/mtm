FROM ruby:2.7.1
FROM nginx:latest

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

COPY ./app/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./app/nginx/nginx.conf /etc/nginx/conf.d/default.conf


RUN mkdir /app
WORKDIR /app
COPY . /app

RUN gem install bundler



# RUN rm -f /etc/nginx/conf.d/*
# ADD nginx/nginx.conf /etc/nginx/conf.d/app.conf
# CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
