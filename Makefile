CONTAINER=php-cli

.PHONY it:
it: build tag start

.PHONY build:
build:
	docker-compose build local

.PHONY start:
start:
	docker-compose up local

.PHONY stop:
stop:
	docker stop ${CONTAINER}
	docker rm ${CONTAINER}

.PHONY restart:
restart: stop start

.PHONY tag:
tag:
	docker tag roeldev/php-cli:local roeldev/php-cli:7.1-v1

.PHONY login:
login:
	docker exec -it ${CONTAINER} bash
