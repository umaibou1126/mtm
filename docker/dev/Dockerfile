FROM ruby:2.7.1-alpine3.10
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

ENV BASE_PACKAGES="alpine-sdk build-base tzdata" \
    WEBPACKER_PACKAGES="python2 yarn nodejs-current nodejs-npm" \
    BUILD_PACKAGE="mysql-client mysql-dev" \
    FAVORITE_PACKAGE="less"

RUN apk update && \
    apk upgrade && \
    apk --update --no-cache add \
    ${BASE_PACKAGES} \
    ${WEBPACKER_PACKAGES} \
    ${BUILD_PACKAGE} \
    ${FAVORITE_PACKAGE}

RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/

RUN bundle install --jobs=4

RUN yarn install
ENV BUNDLE_GEMFILE='/app/Gemfile'
COPY . /app
RUN mkdir -p tmp/sockets
