#!/bin/sh
set -e

phpVersion=$( php -r "echo phpversion();" | cut -d'.' -f 1-2 )
xdebugVersion="2.7.2"

curl -fLs \
    -o /tmp/xdebug.tgz \
    https://xdebug.org/files/xdebug-${xdebugVersion}.tgz

apk add \
    --no-cache \
    --virtual .phpize-dependencies \
    php7.1-dev

tar -xzf /tmp/xdebug.tgz -C /tmp/
cd /tmp/xdebug-${xdebugVersion}

phpize && ./configure && make

cp modules/xdebug.so /usr/lib/php/7.1/modules
touch /etc/php/7.1/conf.d/xdebug.ini
echo "zend_extension=/usr/lib/php/7.1/modules/xdebug.so" >> /etc/php/7.1/conf.d/xdebug.ini

apk del .phpize-dependencies
rm -rf /tmp/*

echo
php -v
