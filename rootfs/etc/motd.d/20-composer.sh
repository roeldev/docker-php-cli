#!/bin/sh

if [ -f /usr/local/bin/composer ]
then
    echo "Composer version: $( composer --version --no-ansi | cut -d' ' -f 3- )"
fi
