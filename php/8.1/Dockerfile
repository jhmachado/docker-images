FROM php:8.1.0-fpm

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


RUN apt-get update && apt-get install -y git

RUN apt-get update && apt-get install -y \
    apt-utils \
    git \
    libzip-dev \
    zip \
    unzip

RUN mkdir /app
WORKDIR /app

COPY . .

ENTRYPOINT ["php-fpm"]