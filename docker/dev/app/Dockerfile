FROM ruby:2.7.1
ENV APP_ROOT /var/www/mtm
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# ディレクトリ作成
RUN mkdir -p $APP_ROOT
RUN mkdir -p /root/tmp
WORKDIR $APP_ROOT

# Node.jsパッケージインストール
RUN apt-get update -qq && apt-get install -y build-essential nodejs

# Nginx, supervisorインストール
RUN apt-get update && apt-get install -y openssh-server supervisor nginx vim git

# supervisor用logディレクトリ作成
RUN mkdir -p /var/run/apache2 /var/run/sshd /var/log/supervisor

# app.conf supervisord.conf作成
COPY app/nginx/nginx.conf /etc/nginx/conf.d/app.conf
COPY app/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf





