FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
	mariadb-server && rm -rf /var/lib/apt/lists/*

COPY my.cnf /etc/mysql/my.cnf

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]