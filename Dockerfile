FROM wordpress:latest

# Copying Themes and Plugins into the wordpress image
COPY ["themes","/var/www/html/wp-content/themes"]
COPY ["plugins","/var/www/html/wp-content/plugins"]

# Updating the configuration of wordpress image with our own
COPY ./config/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

# Applying the execution right on the folders for apache
COPY entrypoint-child.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint-child.sh
ENTRYPOINT ["entrypoint-child.sh"]
CMD ["apache2-foreground"]
