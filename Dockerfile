FROM php:8.1-apache
RUN docker-php-ext-install pdo pdo_mysql

# Enable mod_rewrite
RUN a2enmod rewrite
RUN service apache2 restart
