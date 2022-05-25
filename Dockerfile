FROM php:8.1-apache-buster

ENV APACHE_DOCUMENT_ROOT /storage/branches/country-info-main

### Change which folder to run from
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

### Set correct file permissions for our folder before starting up apache
CMD chmod -R 755  /storage/branches/country-info-main && apache2-foreground