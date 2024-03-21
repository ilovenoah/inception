FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoinst.sh

#COPY ssl_certificate.crt /etc/nginx/ssl/
#COPY ssl_certificate.key /etc/nginx/ssl/
#
#EXPOSE 443
EXPOSE 80 
#
#CMD ["nginx", "-g", "daemon off;"]
CMD ["bash", "/entrypoinst.sh"]
