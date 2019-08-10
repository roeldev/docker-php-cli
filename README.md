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


## Versions

| Image | PHP | Info |
|-------|-----|--------|
| [roeldev/php-cli:7.1-latest][docker-tags-url] | 7.1.28 | [![mb-71-img]][mb-71-url]
| [roeldev/php-cli:7.2-latest][docker-tags-url] | 7.2.17 | [![mb-72-img]][mb-72-url]
| [roeldev/php-cli:7.3-latest][docker-tags-url] | 7.3.4 | [![mb-73-img]][mb-73-url]
| [roeldev/php-cli:7.4-rc-latest][docker-tags-url] | 7.4.0alpha1 | [![mb-74-img]][mb-74-url]


[docker-tags-url]: https://hub.docker.com/r/roeldev/php-cli/tags
[mb-71-img]: https://images.microbadger.com/badges/image/roeldev/php-cli:7.1-latest.svg
[mb-71-url]: https://microbadger.com/images/roeldev/php-cli:7.1-latest
[mb-72-img]: https://images.microbadger.com/badges/image/roeldev/php-cli:7.2-latest.svg
[mb-72-url]: https://microbadger.com/images/roeldev/php-cli:7.2-latest
[mb-73-img]: https://images.microbadger.com/badges/image/roeldev/php-cli:7.3-latest.svg
[mb-73-url]: https://microbadger.com/images/roeldev/php-cli:7.3-latest
[mb-74-img]: https://images.microbadger.com/badges/image/roeldev/php-cli:7.4-rc-latest.svg
[mb-74-url]: https://microbadger.com/images/roeldev/php-cli:7.4-rc-latest


## Installing additional modules
It is possible to install additional modules when the container is initialized by setting the `PHP_EXTENSIONS` environment variable. Module names should not include a php or release version and must be comma separated without trailing comma. Example: `PHP_EXTENSIONS="dom,sodium,yaml"`. See the [links](#links) section for a list of packages that can be installed.


## PHP configuration
The following php.ini directives are changed from their default values:

| Name | Value |
|------|-------|
| expose_php | off
| date.timezone | UTC


## Install scripts
The installer scripts within this container are meant as a starting point for usage in local development images or with Docker multi builds. Usage within production images is not recommended.

### Install Composer
Make sure the required dependencies for Composer (git, unzip) are installed, then run `/usr/local/bin/install_composer.sh`. Composer's install script and signature are downloaded from the Composer website and stored in `/etc/composer/`. The Composer executable is moved to `/usr/local/bin/` and ready to be used.

### Install Xdebug
Run `/usr/local/bin/install_xdebug.sh` to compile xdebug and install the module. It will also copy a default xdebug.ini config file to `/app/config/php/xdebug.ini` where you can change the settings to your needs.


## Links
- GitHub: https://github.com/roeldev/docker-php-cli
- Docker Hub: https://hub.docker.com/r/roeldev/php-cli
- PHP.earth packages: https://repos.php.earth/alpine/v3.9/x86_64/


## License
[GPL-3.0+](LICENSE) © 2019 [Roel Schut](https://roelschut.nl)
