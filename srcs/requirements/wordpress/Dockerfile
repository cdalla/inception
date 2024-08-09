FROM debian:oldstable

RUN apt-get update && apt upgrade

#instal php
RUN apt-get install -y \
    php7.4 \
    php-fpm \
    php-mysql \
    php-cli \
    mariadb-client \
    curl

# create directory for php
RUN mkdir run/php

# create directory for website files
RUN mkdir -p /var/www/html

# change ownership of websit directory
RUN chown -R www-data:www-data /var/www/html

# download WP-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Change permission on cli and move in PATH
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wpconf.sh /tmp/wpconf.sh

RUN chmod +x /tmp/wpconf.sh

EXPOSE 9000

ENTRYPOINT ["/tmp/wpconf.sh"]

CMD ["usr/sbin/php-fpm7.4", "-F"]