FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    openssl \
    nginx \
	procps \
    && rm -rf /var/lib/apt/lists/*

COPY default.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]