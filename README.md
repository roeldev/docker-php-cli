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

[docker-tags-url]: https://hub.docker.com/r/roeldev/php-cli/tags
[mb-71-img]: https://images.microbadger.com/badges/image/roeldev/php-cli:7.1-latest.svg
[mb-71-url]: https://microbadger.com/images/roeldev/php-cli:7.1-latest
[mb-72-img]: https://images.microbadger.com/badges/image/roeldev/php-cli:7.2-latest.svg
[mb-72-url]: https://microbadger.com/images/roeldev/php-cli:7.2-latest
[mb-73-img]: https://images.microbadger.com/badges/image/roeldev/php-cli:7.3-latest.svg
[mb-73-url]: https://microbadger.com/images/roeldev/php-cli:7.3-latest
[mb-74-img]: https://images.microbadger.com/badges/image/roeldev/php-cli:7.4-latest.svg
[mb-74-url]: https://microbadger.com/images/roeldev/php-cli:7.4-latest


## Installed modules
```
[PHP Modules]
Core
ctype
curl
date
filter
hash
json
libxml
mbstring
openssl
pcre
Phar
phpdbg_webhelper
readline
Reflection
SPL
standard
tokenizer
xml
zlib

[Zend Modules]
```

## Install scripts
The installer scripts within this container are meant as a starting point for usage in local development images or with Docker multi builds. Usage within production images is not recommended.

### Install composer
Make sure the required dependencies for composer (git, unzip) are installed, then run `/etc/container/install_composer.sh`.


## Links
- GitHub: https://github.com/roeldev/docker-php-cli
- Docker Hub: https://hub.docker.com/r/roeldev/php-cli
- PHP.earth packages: https://repos.php.earth/alpine/v3.9/x86_64/


## License
[GPL-3.0+](LICENSE) © 2019 [Roel Schut](https://roelschut.nl)
