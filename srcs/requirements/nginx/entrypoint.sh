#!/bin/bash
sed -i "s/DOMAIN_NAME/$DOMAIN_NAME" /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"