#!/bin/sh
set -e

mkdir -p /etc/composer

# download composer installer + signature
curl -fLs \
    --retry 3 \
    --output /etc/composer/composer-installer.php \
    --url https://getcomposer.org/installer

curl -fLs \
    --retry 3 \
    --output /etc/composer/composer-signature.sig \
    --url https://composer.github.io/installer.sig

EXPECTED_SIGNATURE="$( cat /etc/composer/composer-signature.sig )"
ACTUAL_SIGNATURE="$( php -r "echo hash_file('sha384', '/etc/composer/composer-installer.php');" )"

# verify installer signature
if [ "${EXPECTED_SIGNATURE}" != "${ACTUAL_SIGNATURE}" ]
then
    >&2 echo 'ERROR: Invalid composer installer signature'
    rm /etc/composer/composer-installer
    exit 1
fi

# install composer to /usr/local/bin
php /etc/composer/composer-installer.php \
    --quiet \
    --install-dir=/usr/local/bin \
    --filename=composer

composer --version --no-ansi
