#!/bin/bash

# check env variables
if [ -z "$MYSQL_ROOT_PASSWORD" -o -z "$MYSQL_DATABASE" -o -z "$MYSQL_USER" -o -z "$MYSQL_PASSWORD" ]; then
  echo "Error: Missing required environment variables."
  exit 1
fi

#initialize database directory
if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing MariaDB data directory..."
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

