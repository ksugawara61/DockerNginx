FROM php:7-fpm-alpine3.9

# Install git
RUN apk add git

# Install composer
WORKDIR /usr/local/bin
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');" \
 && mv /usr/local/bin/composer.phar /usr/local/bin/composer

# for php app
COPY --chown=www-data:www-data ./app/php /var/www/html/php

# Run composer install for codeigniter app
#RUN cd /var/www/html/php \
# && if [ -f composer.json ]; then composer ; fi
