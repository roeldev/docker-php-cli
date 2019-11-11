# https://hub.docker.com/r/roeldev/base-alpine
FROM roeldev/base-alpine:3.9-v1.2

# expose environment variables
ENV PHP_EXTENSIONS=""

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

ARG PHP_VERSION="7.3"
RUN set -x \
 && apk add \
    --no-cache \
        php${PHP_VERSION} \
        php${PHP_VERSION}-common \
        php${PHP_VERSION}-ctype \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-dom \
        php${PHP_VERSION}-fileinfo \
        php${PHP_VERSION}-iconv \
        php${PHP_VERSION}-json \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-opcache \
        php${PHP_VERSION}-openssl \
        php${PHP_VERSION}-pdo \
        php${PHP_VERSION}-pear \
        php${PHP_VERSION}-phar \
        php${PHP_VERSION}-posix \
        php${PHP_VERSION}-simplexml \
        php${PHP_VERSION}-sodium \
        php${PHP_VERSION}-tokenizer \
        php${PHP_VERSION}-xmlreader \
        php${PHP_VERSION}-xmlwriter \
        php${PHP_VERSION}-zip

RUN set -x \
 # update default php settings
 && sed -i -E 's/;?expose_php = .+/expose_php = off/g' /etc/php/${PHP_VERSION}/php.ini \
 && sed -i -E 's/;?date.timezone =.?/date.timezone = UTC/g' /etc/php/${PHP_VERSION}/php.ini \
 # create folders for php configs/modules without php version in it's path. this
 # allows us to ignore the used php version and add files using COPY rootfs/ /
 && mkdir -p \
    /etc/php.d/ \
    /usr/lib/php/modules/ \
 # move all php configs + add symlink to old location
 && mv /etc/php/${PHP_VERSION}/conf.d/* /etc/php.d/ \
 && rm -rf /etc/php/${PHP_VERSION}/conf.d \
 && ln -s /etc/php.d /etc/php/${PHP_VERSION}/conf.d \
 && chmod -R 0644 /etc/php.d \
 # move all modules + add symlink to old location
 && mv /usr/lib/php/${PHP_VERSION}/modules/* /usr/lib/php/modules/ \
 && rm -rf /usr/lib/php/${PHP_VERSION}/modules \
 && ln -s /usr/lib/php/modules /usr/lib/php/${PHP_VERSION}/modules \
 && chmod -R 0755 /usr/lib/php/modules

COPY rootfs/ /

RUN set -x \
 # make install scripts executable so they can be used within other
 # Dockerfiles. this prevents "Permission denied" errors
 && chmod +x \
    /usr/local/bin/install_composer.sh \
    /usr/local/bin/install_xdebug.sh \
 # update pecl channel definitions
 && pecl update-channels \
 # cleanup
 && rm -rf \
    /tmp/* \
    ~/.pearrc
