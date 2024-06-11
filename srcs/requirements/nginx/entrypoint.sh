#!/bin/bash
set -x
sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" /etc/nginx/conf.d/default.conf
sed -i "s#SSL_CERTIFICATE#/etc/nginx/ssl/rmatsuok.42.fr.crt#g" /etc/nginx/conf.d/default.conf
sed -i "s#SSL_CERTIFICATE_KEY#/etc/nginx/ssl/rmatsuok.42.fr.key#g" /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"