FROM roeldev/base-alpine:3.9-v1

RUN set -x \
 # install dependencies
 && apk update \
 && apk add \
    --no-cache \
        ca-certificates \
        curl \
        openssl \
        libedit \
        libxml2

ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub
RUN set -x \
 # verify repository key
 && EXPECTED_KEY="708c3ad1f676e97cc09b465458734e415c646c092867f509663a89a120474dcee2a242703e6a135d6a9687e9fb3c226756a537630af861505b5096c53b7f91e3 *stdin" \
 && ACTUAL_KEY=$( openssl rsa -pubin -in /etc/apk/keys/phpearth.rsa.pub -text -noout | openssl sha512 -r ) \
 && if [ "${ACTUAL_KEY}" = "${EXPECTED_KEY}" ]; then echo "key verification succeeded!"; \
    else echo "key verification failed!"; exit 1; fi \
 # add repository
 && echo "https://repos.php.earth/alpine/v$( alpine_version )" >> /etc/apk/repositories

ENV PHP_INI_SCAN_DIR=":/app/config/php/"
ARG PHP_VERSION="7.1"
RUN set -x \
 && apk add \
    --no-cache \
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
 # update pecl channel definitions
 && pecl update-channels \
 # cleanup
 && rm -rf \
    /tmp/* \
    ~/.pearrc

COPY rootfs/ /

RUN set -x \
 # make install scripts executable so they can be used within other
 # Dockerfiles. this prevents "Permission denied" errors
 && chmod +x \
    /usr/local/bin/install_composer.sh \
    /usr/local/bin/install_xdebug.sh
