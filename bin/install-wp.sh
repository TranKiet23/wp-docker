#!/bin/sh
set -e

# Wait for WordPress and MySQL to be fully up
sleep 10

# Check if wp-config.php already exists
if [ ! -f /var/www/html/wp-config.php ]; then
  # Create wp-config.php if it does not exist
  wp config create \
    --dbhost=${WORDPRESS_DB_HOST} \
    --dbname=${WORDPRESS_DB_NAME} \
    --dbuser=${WORDPRESS_DB_USER} \
    --dbpass=${WORDPRESS_DB_PASSWORD} \
    --allow-root
fi

# Install WordPress only if it has not been installed
# if ! wp core is-installed --allow-root; then
#   # Install WordPress
#   wp core install \
#     --path="/var/www/html"
#     --title=${TITLE} \
#     --url=${URL} \
#     --admin_user=${ADMIN_USER} \
#     --admin_password=${ADMIN_PASSWORD} \
#     --admin_email=${ADMIN_EMAIL} \
#     --skip-email \
#     --allow-root
# fi

# Install WordPress
wp core install \
  --path="/var/www/html" \
  --title=${TITLE} \
  --url=${URL} \
  --admin_user=${ADMIN_USER} \
  --admin_password=${ADMIN_PASSWORD} \
  --admin_email=${ADMIN_EMAIL}
  # --skip-email \
  # --allow-root