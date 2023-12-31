FROM debian:latest

# Copy the HTML file to the NGINX web root
# COPY index.html /var/www/html/
# COPY index.php /var/www/html

# Install OpenSSL to generate the self-signed certificate
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssl nginx

# Remove the default NGINX configuration
# RUN rm /etc/nginx/conf.d/default.conf

# Generate the self-signed SSL certificate and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/localhost.key -out /etc/nginx/localhost.crt -subj "/C=US/ST=State/L=City/O=Organization/OU=OrganizationalUnit/CN=localhost"

# Copy your custom NGINX configuration to the container
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# Expose port 443 for HTTPS access
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]