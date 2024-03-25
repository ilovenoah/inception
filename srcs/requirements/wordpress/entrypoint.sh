#!/bin/bash

set -x

envsubst '${WORDPRESS_DB_NAME},${WORDPRESS_DB_USER},${WORDPRESS_DB_PASSWORD},${WORDPRESS_DB_HOST}' < /var/www/html/wordpress/wp-config.php.template > /var/www/html/wordpress/wp-config.php

/usr/sbin/php-fpm8.3 -F