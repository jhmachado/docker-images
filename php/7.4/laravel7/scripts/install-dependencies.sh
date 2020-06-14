set -ex

apt-get update && apt-get install -y \
    vim \
    git \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    sqlite3 \
    libsqlite3-dev \
    inetutils-syslogd

docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

apt-get clean && rm -rf /var/lib/apt/lists/*
