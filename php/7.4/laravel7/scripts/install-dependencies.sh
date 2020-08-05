set -ex

apt-get update && apt-get install -y \
    apt-utils \
    vim \
    git \
    libzip-dev \
    zip \
    unzip \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    sqlite3 \
    libsqlite3-dev \
    inetutils-syslogd

docker-php-source extract
pecl install xdebug redis
docker-php-ext-enable xdebug redis
docker-php-source delete
docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

apt-get clean && rm -rf /var/lib/apt/lists/*
