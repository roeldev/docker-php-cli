#!/bin/sh

xdebugVersion=$( php -r "echo phpversion('xdebug');" )

if [ ! -z "${xdebugVersion}" ]
then
    echo "Xdebug version: ${xdebugVersion}"
fi
