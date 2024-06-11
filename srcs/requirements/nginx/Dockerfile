FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

ADD default.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ARG SSL_CERT_PATH
ARG SSL_KEY_PATH
COPY $SSL_CERT_PATH /etc/nginx/ssl/rmatsuok.42.fr.crt
COPY $SSL_KEY_PATH /etc/nginx/ssl/rmatsuok.42.fr.key

CMD ["bash", "/entrypoint.sh"]