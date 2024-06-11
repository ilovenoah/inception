#!/bin/bash
set -x
sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" /etc/nginx/conf.d/default.conf
sed -i "s#SSL_CERTIFICATE#/etc/nginx/ssl/ssl_certificate.crt#g" /etc/nginx/conf.d/default.conf
sed -i "s#SSL_CERTIFICATE_KEY#/etc/nginx/ssl/ssl_certificate.key#g" /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"