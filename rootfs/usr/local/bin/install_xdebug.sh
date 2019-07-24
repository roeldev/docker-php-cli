#!/bin/sh
set -e

phpVersion="$( php -r "echo phpversion();" | cut -d'.' -f 1-2 )"
xdebugVersion="2.7.2"
tmpFile=/tmp/xdebug.tgz

curl -fLs \
    --retry 3 \
    --output ${tmpFile} \
    --url https://xdebug.org/files/xdebug-${xdebugVersion}.tgz

# verify downloaded source
expectedSignature="b0f3283aa185c23fcd0137c3aaa58554d330995ef7a3421e983e8d018b05a4a6  ${tmpFile}"
actualSignature="$( sha256sum ${tmpFile} )"

if [ "${expectedSignature}" != "${actualSignature}" ]
then
    >&2 echo 'ERROR: Invalid xdebug source signature'
    exit 1
fi

apk add \
    --no-cache \
    --virtual .phpize-dependencies \
    php7.1-dev

tar -xzf ${tmpFile} -C /tmp/
cd /tmp/xdebug-${xdebugVersion}

# configure and compile
phpize && ./configure && make

# copy compile module
cp modules/xdebug.so /usr/lib/php/7.1/modules

# make sure the default config is copied to the /app/config/php folder
# so the user can override the default xdebug settings
mkdir -p /app/config/php/ /etc/default-configs/php/
cp /etc/php.d/xdebug.ini.default /etc/default-configs/php/xdebug.ini
cp /etc/php.d/xdebug.ini.default /app/config/php/xdebug.ini

# create a symlink so the xdebug settings can be used by php
ln -s /app/config/php/xdebug.ini /etc/php.d/xdebug.ini

# clean up
apk del .phpize-dependencies
rm -rf /tmp/*

echo
php -v
