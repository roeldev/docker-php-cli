build:
	docker build -t roeldev/php-cli:local .

start:
	docker run --name phpcli roeldev/php-cli:local

login:
	docker exec -it phpcli bash
