# Usando PHP 8.3
FROM php:8.3-fpm

ARG UID=1000
ARG GID=1000
RUN usermod -u $UID www-data && groupmod -g $GID www-data

# Instalar dependências
RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libpq-dev \
    libmcrypt-dev \
    supervisor \
    lsb-release \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Instalar Node.js e npm
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Definir diretório de trabalho
WORKDIR /var/www/html

# Copiar os arquivos do Laravel para o contêiner
COPY . .

# Instalar extensões PHP adicionais
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Garantir que as pastas existem antes de aplicar permissões
RUN mkdir -p /var/www/html/storage /var/www/html/bootstrap/cache && \
    chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache && \
    chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Copiar configurações do Supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expor porta
EXPOSE 9000

CMD ["php-fpm"]
