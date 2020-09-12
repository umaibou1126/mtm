FROM ruby:2.7.1
ENV APP_ROOT /var/www/mtm
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# ディレクトリ作成
RUN mkdir -p $APP_ROOT
RUN mkdir -p /root/tmp
WORKDIR $APP_ROOT

# Node.js、Nginx, supervisorインストール
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    git \
    libcurl4-openssl-dev \
    libghc-yaml-dev \
    libqt5webkit5-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    linux-headers-amd64 \
    default-mysql-client \
    nginx \
    nodejs \
    openssl \
    ruby-dev \
    ruby-json \
    tzdata \
    vim \
    supervisor \
    zlib1g-dev && \
    apt-get clean -y && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# supervisor用logディレクトリ作成
RUN mkdir -p /var/run/apache2 /var/run/sshd /var/log/supervisor

# app.conf supervisord.conf作成
COPY app/nginx/nginx.conf /etc/nginx/nginx.conf
COPY app/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf





