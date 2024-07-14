#!/bin/bash
set -x

if [ ! -f /etc/nginx/ssl/ssl_certificate.crt ]; then
  mkdir -p /etc/nginx/ssl
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/ssl_certificate.key -out /etc/nginx/ssl/ssl_certificate.crt -subj "/CN=${DOMAIN_NAME}"
fi

sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"