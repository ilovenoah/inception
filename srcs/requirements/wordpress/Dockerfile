FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    software-properties-common \
    gnupg \
    wget \
    unzip \
	curl \
	gettext-base \
	mlocate \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/apt/keyrings
RUN echo "deb [signed-by=/etc/apt/keyrings/sury-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list

RUN curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/keyrings/sury-php.gpg
RUN set -ex; \
		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
		chmod +x wp-cli.phar; \
		mv wp-cli.phar /usr/local/bin/wp

RUN apt-get update && apt-get install -y \
    php8.3-fpm \
    php8.3-mysql \
    php8.3-curl \
    php8.3-gd \
    php8.3-intl \
    php8.3-mbstring \
    php8.3-xml \
    php8.3-zip \
	php8.3-cli \
	php8.3-pdo \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
RUN wget https://wordpress.org/wordpress-6.4.3.zip && \
    unzip wordpress-6.4.3.zip && \
    rm wordpress-6.4.3.zip && \
    chown -R www-data:www-data /var/www/html/wordpress && \
	find /var/www/html/wordpress -type d -exec chmod 755 {} \; && \
	find /var/www/html/wordpress -type f -exec chmod 644 {} \;

COPY wp-config.php /var/www/html/wordpress/wp-config.php
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /run/php
RUN sed -i 's/listen = \/run\/php\/php8.3-fpm.sock/listen = 9000/' /etc/php/8.3/fpm/pool.d/www.conf

CMD ["bash", "/entrypoint.sh"]