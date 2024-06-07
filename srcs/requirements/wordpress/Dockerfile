FROM debian:oldstable

RUN apt update && \
    apt upgrade && \
    apt install -y \
    wget \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    mariadb-client && \
    wget https://wordpress.org/wordpress-6.4.2.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf wordpress-6.4.2.tar.gz && \
    rm wordpress-6.4.2.tar.gz && \  
    chown -R root:root /var/www/wordpress && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir /run/php

COPY tools/wpconf.sh /tmp/wpconf.sh

EXPOSE 9000

ENTRYPOINT ["bash", "/tmp/wpconf.sh"]

CMD ["php-fpm7.4", "-F"]