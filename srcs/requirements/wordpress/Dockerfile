FROM debian:latest

# Set working directory inside the container
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php php-fpm

# Install any additional PHP extensions
RUN mkdir -p /var/www/html/wordpress \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /var/www/html/wordpress/

# Copy your PHP application files into the container
COPY ./index.php /var/www/html/

EXPOSE 9000

# CMD ['php-fpm8.2']