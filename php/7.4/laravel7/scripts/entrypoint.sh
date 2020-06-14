#!/bin/bash

set -e

composer install

if [ "${SHOULD_SKIP_MIGRATIONS}" ]; then
  echo "Skipping database migration"
else
  wait-for-it.sh mysql:3306 -t 600
  echo "MySQL connection established"
  php artisan migrate
fi

chown -R www-data:www-data /app/storage
chown -R www-data:www-data /app/bootstrap/cache

if [ "${SHOULD_SKIP_SERVICES}" ]; then
  echo "Skipping services start"
else
  service inetutils-syslogd start
  apache2-foreground
fi
