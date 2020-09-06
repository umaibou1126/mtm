FROM ruby:2.7.1
FROM nginx:1.15.8
ENV APP_ROOT /var/www/mtm

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN mkdir -p $APP_ROOT
RUN mkdir -p /root/tmp
WORKDIR $APP_ROOT

RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor




COPY nginx/nginx.conf /etc/nginx/conf.d/app.conf
COPY supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf




