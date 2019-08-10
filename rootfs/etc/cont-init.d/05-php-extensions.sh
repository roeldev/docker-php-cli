#!/usr/bin/with-contenv bash

if [[ -z "${PHP_EXTENSIONS}" ]]
then
    exit 0
fi

echo "Installing additional PHP extensions..."
prefix="php$( php -r "echo phpversion();" | cut -d'.' -f-2 )-"
extensions="${prefix}$( sed -E "s/,(\w+)/ ${prefix}\1/g" <<< ${PHP_EXTENSIONS} )"

VERBOSE_INIT=${VERBOSE_INIT:-false}
if ! ${VERBOSE_INIT}
then
    IFS=" "
    for ext in ${extensions}
    do echo "  ${ext}"
    done
fi

apk update $( if ! ${VERBOSE_INIT}; then echo '--quiet'; fi )
apk add \
    --no-cache \
    $( if ! ${VERBOSE_INIT}; then echo '--quiet'; fi ) \
    ${extensions}
