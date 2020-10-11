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

# copy app
RUN mkdir -p $APP_ROOT
COPY . $APP_ROOT
WORKDIR /var/www/mtm
RUN mkdir -p /root/tmp

# bundle install
RUN cp -r docker/pre/app/.bundle .
#COPY . $APP_ROOT
RUN bundle install --path vendor/bundle
# RUN bundle exec rake assets:precompile

# aws-cli install
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py && pip install awscli
RUN rm get-pip.py


# Create test user
RUN adduser --disabled-password --home /home/test test
RUN echo "test ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# プロンプトの色変更など
# COPY docker/pre/app/common/prompt.sh /etc/profile.d/
# RUN chmod 755  /etc/profile.d/prompt.sh
# COPY docker/pre/app/common/.bashrc /home/test/


# Add authorized_keys
RUN sudo -u test mkdir /home/test/.ssh
RUN mv authorized_keys /home/test/.ssh/
RUN chmod 600 /home/test/.ssh/authorized_keys
RUN chown test:test /home/test/.ssh/authorized_keys


# Add id_rsa_github
RUN mkdir /root/.ssh
COPY docker/pre/app/common/.gitconfig /root/.gitconfig
RUN mv id_rsa_* id_rsa_github
RUN mv id_rsa_github /root/.ssh/
RUN mv config-ssh /root/.ssh/config
RUN chmod 600 /root/.ssh/id_rsa_github
RUN chmod 600 /root/.ssh/config




# Add aws credentials
RUN mkdir /home/test/.aws
RUN mv .aws/credentials /home/test/.aws/
RUN sudo chown test:test /home/test/.aws/credentials



# Setup ssh
RUN sed -ri 's/^#Port 22/Port 123456/' /etc/ssh/sshd_config
RUN sed -ri 's/^#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN sed -ri 's/^#PermitUserEnvironment no/PermitUserEnvironment no/' /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN mkdir -p /run/sshd




# supervisor用logディレクトリ作成
RUN mkdir -p /var/log/supervisor

# nginx.conf, conf.d/app.conf作成
COPY docker/prod/app/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/prod/app/nginx/portfoliough.com.conf /etc/nginx/conf.d/portfoliough.com.conf

# supervisord.conf, conf.d/app.conf作成
COPY docker/prod/app/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY docker/prod/app/supervisor/app.conf /etc/supervisor/conf.d/app.conf



# シンボリックリンク（ヘルスチェックログ）
# 各nginxアクセスログ
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stdout /var/log/nginx/portfoliough.com.access.log
RUN ln -sf /dev/stderr /var/log/nginx/portfoliough.com.error.log

# アプリケーションログ(pumaログ)
RUN ln -sf /dev/stdout $APP_ROOT/log/development.log
RUN ln -sf /dev/stdout $APP_ROOT/log/production.log

CMD [ "/usr/bin/supervisord" ]
