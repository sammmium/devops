# development
init: docker-down-clear docker-pull docker-build docker-up
up: docker-up
down: docker-down
restart: down up

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

# production
build: build-gateway build-frontend build-api

build-gateway:
	docker --log-level=debug build --pull --file=gateway/docker/production/nginx/Dockerfile --tag=${REGISTRY}/site-gateway:${IMAGE_TAG} gateway/docker/production/nginx
#										  имя файла, из которого контейнер будем собирать   под каким именем сохраним образ             из какой папки образ собираем
build-frontend:
	docker --log-level=debug build --pull --file=frontend/docker/production/nginx/Dockerfile --tag=${REGISTRY}/site-frontend:${IMAGE_TAG} frontend

build-api:
	docker --log-level=debug build --pull --file=api/docker/production/php-fpm/Dockerfile --tag=${REGISTRY}/site-api-php-fpm:${IMAGE_TAG} api
	docker --log-level=debug build --pull --file=api/docker/production/nginx/Dockerfile --tag=${REGISTRY}/site-api:${IMAGE_TAG} api

try-build:
	REGISTRY=localhost IMAGE_TAG=0 make build
