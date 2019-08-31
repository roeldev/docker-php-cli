IMAGE_7.1=roeldev/php-cli:7.1-local
IMAGE_7.2=roeldev/php-cli:7.2-local
IMAGE_7.3=roeldev/php-cli:7.3-local
IMAGE_7.4=roeldev/php-cli:7.4-rc-local

SERVICE_7.1=php-cli_7.1
SERVICE_7.2=php-cli_7.2
SERVICE_7.3=php-cli_7.3
SERVICE_7.4=php-cli_7.4-rc

###############################################################################
it: 7.3
all: 7.1-build 7.2-build 7.3-build 7.4-build
start: 7.3-start
login: 7.3-login

###############################################################################
7.1: 7.1-build 7.1-start 7.1-login
7.1-restart: 7.1-stop 7.1-start

7.1-build:
	docker-compose build --force-rm --pull ${SERVICE_7.1}

7.1-start:
	docker-compose up ${SERVICE_7.1}

7.1-stop:
	docker stop ${SERVICE_7.1}

7.1-login:
	docker exec -it ${SERVICE_7.1} bash

7.1-inspect:
	docker inspect ${IMAGE_7.1}

###############################################################################
7.2: 7.2-build 7.2-start 7.2-login
7.2-restart: 7.2-stop 7.2-start

7.2-build:
	docker-compose build --force-rm --pull ${SERVICE_7.2}

7.2-start:
	docker-compose up ${SERVICE_7.2}

7.2-stop:
	docker stop ${SERVICE_7.2}

7.2-login:
	docker exec -it ${SERVICE_7.2} bash

7.2-inspect:
	docker inspect ${IMAGE_7.2}

###############################################################################
7.3: 7.3-build 7.3-start 7.3-login
7.3-restart: 7.3-stop 7.3-start

7.3-build:
	docker-compose build --force-rm --pull ${SERVICE_7.3}

7.3-start:
	docker-compose up ${SERVICE_7.3}

7.3-stop:
	docker stop ${SERVICE_7.3}

7.3-login:
	docker exec -it ${SERVICE_7.3} bash

7.3-inspect:
	docker inspect ${IMAGE_7.3}

###############################################################################
7.4: 7.4-build 7.4-start 7.4-login
7.4-restart: 7.4-stop 7.4-start

7.4-build:
	docker-compose build --force-rm --pull ${SERVICE_7.4}

7.4-start:
	docker-compose up ${SERVICE_7.4}

7.4-stop:
	docker stop ${SERVICE_7.4}

7.4-login:
	docker exec -it ${SERVICE_7.4} bash

7.4-inspect:
	docker inspect ${IMAGE_7.4}

###############################################################################
.PHONY it build start stop kill restart inspect tag login:
.PHONY 7.1 7.1-build 7.1-start 7.1-stop 7.1-restart 7.1-login 7.1-inspect:
.PHONY 7.2 7.2-build 7.2-start 7.2-stop 7.2-restart 7.2-login 7.2-inspect:
.PHONY 7.3 7.3-build 7.3-start 7.3-stop 7.3-restart 7.3-login 7.3-inspect:
.PHONY 7.4 7.4-build 7.4-start 7.4-stop 7.4-restart 7.4-login 7.4-inspect:
