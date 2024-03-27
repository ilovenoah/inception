#!/bin/bash

set -x

sed -i "s/WORDPRESS_DB_NAME/$WORDPRESS_DB_NAME/g" /var/www/html/wordpress/wp-config.php
sed -i "s/WORDPRESS_DB_USER/$WORDPRESS_DB_USER/g" /var/www/html/wordpress/wp-config.php
sed -i "s/WORDPRESS_DB_PASSWORD/$WORDPRESS_DB_PASSWORD/g" /var/www/html/wordpress/wp-config.php
sed -i "s/WORDPRESS_DB_HOST/$WORDPRESS_DB_HOST/g" /var/www/html/wordpress/wp-config.php

/usr/sbin/php-fpm8.3 -F