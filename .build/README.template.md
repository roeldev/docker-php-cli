docker-php-cli
==============

[![Latest release][latest-release-img]][latest-release-url]
[![Travis build status][travis-build-img]][travis-build-url]
[![Docker build status][docker-build-img]][docker-build-url]
[![Docker Hub downloads][docker-pulls-img]][docker-pulls-url]

[latest-release-img]: https://img.shields.io/github/release/roeldev/docker-php-cli.svg?label=latest
[latest-release-url]: https://github.com/roeldev/docker-php-cli/releases
[travis-build-img]: https://img.shields.io/travis/roeldev/docker-php-cli.svg
[travis-build-url]: https://travis-ci.org/roeldev/docker-php-cli
[docker-build-img]: https://img.shields.io/docker/cloud/build/roeldev/php-cli.svg
[docker-build-url]: https://hub.docker.com/r/roeldev/php-cli
[docker-pulls-img]: https://img.shields.io/docker/pulls/roeldev/php-cli.svg
[docker-pulls-url]: https://hub.docker.com/r/roeldev/php-cli


A custom image with PHP, based on Alpine Linux with S6 overlay.

| Image | PHP | Info |
|-------|-----|------|
{{readme_versions_table}}


## Modules
Below is the result from `php -m`, a list of the modules that are installed by default:

{{readme_modules_table}}

### Installing additional modules
It is possible to install additional modules when the container is initialized by setting the `PHP_EXTENSIONS` environment variable. Extension names should not include a php or release version and must be comma separated without trailing comma. Example: `PHP_EXTENSIONS="sockets,yaml"`. See the [links](#links) section for a list of extensions that can be installed from PHP.earth.


## PHP configuration
The following php.ini directives are changed from their default values:

| Name | Value |
|------|-------|
| expose_php | off
| date.timezone | UTC


## Installer scripts
The installer scripts within this container are meant as a starting point for usage in local development images or with Docker multi builds. Using them in production images is not recommended.

### Install Composer
Run `/usr/local/bin/install_composer.sh` to download the official Composer install script. It is stored in `/etc/composer/` together with the installer's signature. The install_composer.sh script will check if the signature matches and executes the installer. The Composer executable is then placed in `/usr/local/bin/` and is ready to be used.
> Make sure to add `/root/.composer/vendor/bin` to your PATH if you'd like to make use of binaries from global packages.

### Install Xdebug
Run `/usr/local/bin/install_xdebug.sh` to compile xdebug and install the module. It will then copy a default xdebug.ini config file to `/app/config/php/xdebug.ini` where you can change the settings to your needs.
After installing xdebug it is possible to enable/disable the extension at runtime with `/usr/local/bin/xdebug_enable.sh` and `/usr/local/bin/xdebug_disable.sh`. This does not remove xdebug but simply enables/disables loading of the extensions by PHP.


## Links
- GitHub: https://github.com/roeldev/docker-php-cli
- Docker Hub: https://hub.docker.com/r/roeldev/php-cli
- PHP: https://php.net
- PHP.earth packages: https://repos.php.earth/alpine/v3.9/x86_64/


## License
[GPL-3.0+](LICENSE) © 2019 [Roel Schut](https://roelschut.nl)
