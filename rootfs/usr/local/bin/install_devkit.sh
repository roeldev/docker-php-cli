 #!/bin/sh
set -e

composer global require \
    --no-ansi \
    --no-cache \
        laravel/installer \
        phploc/phploc \
        phpstan/phpstan-shim \
        roeldev/phpcs-ruleset \
        squizlabs/php_codesniffer

# add custom phpcs standard to available default standards
ln -s \
    /composer/vendor/roeldev/phpcs-ruleset \
    /composer/vendor/squizlabs/php_codesniffer/src/Standards/roeldev
