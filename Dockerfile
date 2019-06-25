# https://hub.docker.com/_/php
ARG PHP_VERSION=latest
FROM php:${PHP_VERSION}-cli-alpine as php
COPY phpenv.php /

# prepare files to copy to main image
RUN set -x \
 && mkdir /root-out \
 && cd /root-out/ \
 && php /phpenv.php >> .phpenv.json \
 && mkdir -p usr var \
 && cp -a /usr/local usr/local \
 && cp -a /usr/src usr/src \
 && cp -a /var/www var/www

# create actual image
FROM roeldev/base-alpine

# make sure www-data user and group exist
RUN set -x \
 && addgroup -g 82 -S www-data \
 && adduser -u 82 -D -S -G www-data www-data

# take php related files etc.
COPY --from=php /root-out /
ENV PHP_INI_DIR="/usr/local/etc/php"

# install dependencies
RUN apk add --no-cache \
        libedit \
        libxml2 \
        ca-certificates \
        curl \
        tar \
        xz \
        openssl \
 && pecl update-channels \
 && rm -rf /tmp/* ~/.pearrc

COPY systemfiles/ /
