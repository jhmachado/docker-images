set -ex

apt-get update && apt-get install -y \
    cron \
    git \
    gzip \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libsodium-dev \
    libssh2-1-dev \
    libxslt1-dev \
    libzip-dev \
    lsof \
    default-mysql-client \
    vim \
    zip \
    && apt-get clean

docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

docker-php-ext-install \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    gettext \
    intl \
    mbstring \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    soap \
    sockets \
    sodium \
    sysvmsg \
    sysvsem \
    sysvshm \
    xsl \
    zip

rm -rf /var/lib/apt/lists/*

pecl channel-update pecl.php.net \
    && pecl install xdebug

docker-php-ext-enable xdebug \
    && sed -i -e 's/^zend_extension/\;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
