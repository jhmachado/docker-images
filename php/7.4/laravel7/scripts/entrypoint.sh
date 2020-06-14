#!/bin/bash

set -e

composer install

if [ !$autobuild ]; then
    wait-for-it.sh mysql:3306 -t 600
    echo "MySQL connection established"
    php artisan migrate
fi

chown -R www-data:www-data /app/storage
chown -R www-data:www-data /app/bootstrap/cache

service inetutils-syslogd start

apache2-foreground
