FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

COPY conf /etc/nginx/nginx.conf

COPY ssl_certificate.crt /etc/nginx/ssl/
COPY ssl_certificate.key /etc/nginx/ssl/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
