# Use a imagem oficial do PHP 8.2 com Apache
FROM php:8.2-apache

# Instalar extensões necessárias para MySQL e Redis
RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install redis && docker-php-ext-enable redis

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Instalar dependências adicionais
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite

# Definir o diretório de trabalho
WORKDIR /var/www/html

# Expor a porta 80
EXPOSE 80

# Comando para iniciar o Apache
CMD ["apache2-foreground"]