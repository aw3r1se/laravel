FROM php:7.4-fpm

USER root

#COPY composer.lock composer.json package.json package-lock.json  /var/www/

# Set working directory
WORKDIR /var/www

#фикс
RUN chmod -R 777 storage

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    libzip-dev \
    zip \
    libmagickwand-dev \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    libonig-dev \
    curl \
    sudo \
    imagemagick \
    nano \
    mc

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pecl install imagick && docker-php-ext-enable imagick

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl

#Install xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy existing application directory contents
COPY . /var/www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
