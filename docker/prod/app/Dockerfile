FROM ruby:2.7.1
ENV APP_ROOT /var/www/mtm
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo


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

RUN apt-get update \
    && apt-get install -y openssh-server \
    && mkdir -p /var/run/sshd





# ディレクトリ作成
RUN mkdir -p $APP_ROOT
RUN mkdir -p /root/tmp

# bundle install
WORKDIR $APP_ROOT
COPY . $APP_ROOT
RUN bundle install --path vendor/bundle



# supervisor用logディレクトリ作成
RUN mkdir -p /var/log/supervisor

# nginx.conf, conf.d/app.conf作成
COPY docker/prod/app/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/prod/app/nginx/rails.com.conf /etc/nginx/conf.d/rails.com.conf
#COPY app/nginx/healthcheck.conf /etc/nginx/conf.d/healthcheck.conf

# supervisord.conf, conf.d/app.conf作成
COPY docker/prod/app/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY docker/prod/app/supervisor/app.conf /etc/supervisor/conf.d/app.conf


# docker-entrypoint.sh
COPY docker/prod/app/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh


# シンボリックリンク（ヘルスチェックログ）
# 各nginxアクセスログ
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stdout /var/log/nginx/rails.com.access.log
#RUN ln -sf /dev/stdout /var/log/nginx/healthcheck.access.log
RUN ln -sf /dev/stderr /var/log/nginx/rails.com.error.log
#RUN ln -sf /dev/stderr /var/log/nginx/healthcheck.error.log

# アプリケーションログ(pumaログ)
RUN ln -sf /dev/stdout $APP_ROOT/log/development.log
RUN ln -sf /dev/stdout $APP_ROOT/log/production.log

CMD [ "/usr/bin/supervisord" ]
