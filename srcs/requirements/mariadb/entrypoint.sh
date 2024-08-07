#!/bin/bash

# check env variables
if [ -z "$MYSQL_ROOT_PASSWORD" -o -z "$WORDPRESS_DB_NAME" -o -z "$WORDPRESS_DB_USER" -o -z "$WORDPRESS_DB_PASSWORD" ]; then
  echo "Error: Missing required environment variables."
  exit 1
fi

# initialize database directory
if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing MariaDB data directory..."
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# start MariaDB server
echo "Starting MariaDB server..."
mysqld --user=mysql &

# wait for MariaDB server to start
until mysqladmin ping -h"localhost" --silent; do
  echo "Waiting for MariaDB server to start..."
  sleep 1
done

# set root password
if [ -n "$MYSQL_ROOT_PASSWORD" ]; then
  echo "Setting root password..."
  mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
fi

# create database and user
echo "Creating database and user..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$WORDPRESS_DB_NAME\`;"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL ON \`$WORDPRESS_DB_NAME\`.* TO '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"

# create WordPress database
echo "Creating WordPress database..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`wordpress\`;"

# stop MariaDB server
echo "Stopping MariaDB server..."
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# start MariaDB server in foreground
echo "Starting MariaDB server..."
exec mysqld --user=mysql