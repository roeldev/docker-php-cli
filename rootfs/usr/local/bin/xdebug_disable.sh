#!/bin/sh
set -e

if [ -f /etc/php.d/xdebug.ini ]
then
    sed -i -E \
        's/zend_extension=(.*xdebug\.so)/;zend_extension=\1/g' \
        /etc/php.d/xdebug.ini
fi
