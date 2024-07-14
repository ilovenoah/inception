FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    openssl \
    nginx \
    && rm -rf /var/lib/apt/lists/*

ADD default.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]