FROM php:8.1-apache-buster

ENV APACHE_DOCUMENT_ROOT /storage/branches/country-info-main

### Change which folder to run from
### (copied from instructions for the docker image)
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

### Set correct file permissions for our folder before starting up apache
### (if not we get permissions denied)
### The "apache2-foreground" command copied from the details about the docker image, specific tag "php:8.1-apache-buster"
CMD chmod -R 755  /storage/branches/country-info-main && \
  sed -i '0,/Listen [0-9]*/s//Listen $PORT/' /etc/apache2/conf-available/*.conf && \
  apache2-foreground

