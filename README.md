# CHASSI LARAVEL 11

## Recursos

- PHP 8.3
- MySQL 8
- Nginx
- Laravel 11+
- Redis
- Localstack - https://app.localstack.cloud/ (login via github)
- RabbitMQ - http://localhost:15672 (guest - guest)

## Instalação

Este chassi requer o docker instalado [Docker](https://www.docker.com/).

Obtendo o repositório via github.

```sh
git clone git@github.com:evandromureb/chassi-laravel.git
cd chassi-laravel
```

**Subindo os containers na primeira execução**
```sh
make init
```

---

**Rodar o container:**
```sh
make up
```

**Acessar o bash da aplicação:**
```sh
make bash
```

**Parar o container:**
```sh
make down
```

**Parar o container e remover os volumes:**
```sh
make downv
```

**Contstruir os containers:**
```sh
make build
```

**Contstruir os containers e subir a aplicação:**
```sh
make build-up
```
**Dar permissões as pastas do sistema:**
```sh
make permissions
```

---

## Sistema

**Atualizar sistema:**
```sh
make updateSystem
```
**Rodar as migrations do Laravel:**
```sh
make migrate
```
**Rodar os testes da aplicação:**
```sh
make test
```
**Rodar o Laravel Pint:**
```sh
make pint
```
**Rodar o Larastan:**
```sh
make stan
```
**Limpar o cache da aplicação:**
```sh
make cacheClear
```
**Rodar o composer-install:**
```sh
make composer-install
```
**Rodar o npm-install:**
```sh
make npm-install
```
