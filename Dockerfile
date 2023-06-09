FROM prestashop/prestashop:1.7

RUN apt-get update && \
    apt-get install -y libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql

COPY src/ /var/www/html