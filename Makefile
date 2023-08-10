server {
    listen 443 ssl;

    server_name localhost;
    ssl_certificate /etc/nginx/localhost.crt;
    ssl_certificate_key /etc/nginx/localhost.key;

    index page-login.html;
    root /var/www/html/;
    # include /etc/nginx/mime.types;
    # sendfile on;
    # location ~* \.(js|css)$ {
    #     root /usr/share/nginx/html/;
    # }

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass php:9000;  # Replace 'php-fpm-container' with your actual PHP-FPM container name
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    # location ~ \.css {
    #     add_header  Content-Type    text/css;
    # }

    # location ~ \.js {
    #     add_header  Content-Type    application/x-javascript;
    # }

}