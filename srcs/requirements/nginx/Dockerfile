FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

ADD default.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#COPY ssl_certificate.crt /etc/nginx/ssl/
#COPY ssl_certificate.key /etc/nginx/ssl/
CMD ["bash", "/entrypoint.sh"]
