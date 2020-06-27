#!/bin/bash

set -e

composer install

if [ "${SHOULD_SKIP_SERVICES}" ]; then
  echo "Skipping services start"
else
  service inetutils-syslogd start
  apache2-foreground
fi
