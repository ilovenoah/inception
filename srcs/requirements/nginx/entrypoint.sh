#!/bin/bash
set -x
sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"