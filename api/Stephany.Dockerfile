# ================================
# Stephany.Dockerfile (Backend Laravel)
# PHP 8.2 con Composer y PostgreSQL
# ================================
FROM php:8.2-cli

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpq-dev \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo_pgsql pgsql

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

# Crear carpeta de la app
WORKDIR /var/www/html

# Copiar composer.json y composer.lock primero (para cachear dependencias)
COPY composer.json composer.lock* ./

# Instalar dependencias PHP de Laravel
RUN composer install --no-scripts --no-autoloader || true

# Copiar todo el código del backend
COPY . .

# Ejecutar autoload después de copiar
RUN composer dump-autoload

# Exponer puerto de Laravel
EXPOSE 8000

# Comando por defecto (Laravel dev server)
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
