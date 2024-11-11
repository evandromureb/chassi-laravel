# Nome do container Docker
CONTAINER_NAME=chassi-laravel

# Caminho do diretório do projeto
PROJECT_DIR=$(shell pwd)

# Caminho do Docker Compose
DOCKER_COMPOSE=docker-compose

# Comandos para rodar containers
up:
	$(DOCKER_COMPOSE) up -d

# Parar os containers
down:
	$(DOCKER_COMPOSE) down

# Parar os containers
downv:
	$(DOCKER_COMPOSE) down -v

# Construir os containers
build:
	$(DOCKER_COMPOSE) build

# Rodar migrations
migrate:
	docker exec -it $(CONTAINER_NAME) php artisan migrate

# Rodar os testes
test:
	docker exec -it $(CONTAINER_NAME) php artisan test

# Acessar o container
bash:
	docker exec -it $(CONTAINER_NAME) bash

# Instalar dependências via Composer
composer-install:
	docker exec -it $(CONTAINER_NAME) composer install

# Instalar dependências via NPM
npm-install:
	docker exec -it $(CONTAINER_NAME) npm install

# Build e up ao mesmo tempo
build-up: build up

# Comandos para instalar laravel
init:
	$(DOCKER_COMPOSE) down -v;
	$(DOCKER_COMPOSE) build;
	$(DOCKER_COMPOSE) up -d;
	docker exec -it $(CONTAINER_NAME) git config --global --add safe.directory /var/www/html
	docker exec -it $(CONTAINER_NAME) chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache /var/www/html/.husky /var/www/html/config;
	docker exec -it $(CONTAINER_NAME) chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache /var/www/html/.husky /var/www/html/config;
	docker exec -it $(CONTAINER_NAME) composer install;
	docker exec -it $(CONTAINER_NAME) npm install;
	docker exec -it $(CONTAINER_NAME) cp .env.example .env;
	docker exec -it $(CONTAINER_NAME) php artisan key:generate;
	docker exec -it $(CONTAINER_NAME) sleep 10;
	docker exec -it $(CONTAINER_NAME) php artisan migrate

# Comando para dar permissões as pastas
permissions:
	docker exec -it $(CONTAINER_NAME) git config --global --add safe.directory /var/www/html
	docker exec -it $(CONTAINER_NAME) chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache /var/www/html/.husky /var/www/html/config;
	docker exec -it $(CONTAINER_NAME) chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache /var/www/html/.husky /var/www/html/config;

# Comando para executar o Laravel Pint
pint:
	docker exec -it $(CONTAINER_NAME) ./vendor/bin/pint

# Comando para executar o Larastan
stan:
	docker exec -it $(CONTAINER_NAME) ./vendor/bin/phpstan

# Comando para atualizar as bibliotecas do sistema e atualizar o Laravel
updateSystem:
	docker exec -it $(CONTAINER_NAME) composer update

# Comando para atualizar as bibliotecas do sistema e atualizar o Laravel
cacheClear:
	docker exec -it $(CONTAINER_NAME) php artisan optimize:clear
