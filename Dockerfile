FROM roeldev/base-alpine:latest

ARG PHP_VERSION=7.1
ENV PHP_VERSION=${PHP_VERSION}
ENV PHP_INI_DIR="/usr/local/etc/php"

ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub

RUN set -x \
 && echo "https://repos.php.earth/alpine/v3.9" >> /etc/apk/repositories \
 # ensure www-data user and group exists, 82 is the standard uid/gid in Alpine
 && addgroup -g 82 -S www-data \
 && adduser -u 82 -D -S -G www-data www-data \
 # install dependencies
 && apk add \
    --no-cache \
        ca-certificates \
        openssl \
        libedit \
        libxml2 \
        php${PHP_VERSION} \
        php${PHP_VERSION}-common \
        php${PHP_VERSION}-ctype \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-json \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-openssl \
        php${PHP_VERSION}-pear \
        php${PHP_VERSION}-phar \
        php${PHP_VERSION}-tokenizer \
        ${PHP_EXTENSIONS} \
 # create directories
 && mkdir -p "${PHP_INI_DIR}/conf.d" /var/www/html \
 && chown www-data:www-data /var/www/html \
 && chmod 777 /var/www/html \
 # update pecl channel definitions
 && pecl update-channels \
 && rm -rf /tmp/* ~/.pearrc

COPY systemfiles/ /
