# development
init: docker-down-clear docker-pull docker-build docker-up
up: docker-up
down: docker-down
restart: down up
in: docker-in

docker-pull:
	docker compose pull

docker-build:
	docker compose build --pull

docker-down-clear:
	docker compose down -v --remove-orphans

docker-up:
	docker compose up -d

docker-down:
	docker compose down --remove-orphans

docker-in:
	docker exec -it devops_ubuntu bash

