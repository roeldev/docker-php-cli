# https://hub.docker.com/_/php
FROM php:7.1-cli-alpine as php
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

# runtime stage
FROM roeldev/base-alpine

# make sure www-data user and group exist
RUN set -x \
 && addgroup -g 82 -S www-data \
 && adduser -u 82 -D -S -G www-data www-data

# take php related files etc.
COPY --from=php /root-out /

# install dependencies
RUN apk add --no-cache \
        libedit \
        libxml2 \
        ca-certificates \
        curl \
        tar \
        xz \
        openssl

COPY systemfiles/ /
ENV PHP_INI_DIR="/usr/local/etc/php"
