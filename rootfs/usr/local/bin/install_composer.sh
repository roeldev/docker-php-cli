#!/bin/sh
set -e

installerFile=/etc/composer/composer-installer.php
signatureFile=/etc/composer/composer-signature.sig

mkdir -p /etc/composer

# download composer installer + signature
curl -fLs \
    --retry 3 \
    --output ${installerFile} \
    --url https://getcomposer.org/installer

curl -fLs \
    --retry 3 \
    --output ${signatureFile} \
    --url https://composer.github.io/installer.sig

# verify installer signature
expectedSignature="$( cat ${signatureFile} )"
actualSignature="$( php -r "echo hash_file('sha384', '${installerFile}');" )"

if [ "${expectedSignature}" != "${actualSignature}" ]
then
    >&2 echo 'ERROR: Invalid composer installer signature'
    exit 1
fi

# run composer installer and install to /usr/local/bin
php ${installerFile} \
    --quiet \
    --install-dir=/usr/local/bin \
    --filename=composer

composer --version --no-ansi
