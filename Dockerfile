FROM ubuntu:16.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install net-tools nginx && \
    useradd -ms /bin/bash aurora && \
    rm -f /etc/nginx/fastcgi.conf /etc/nginx/fastcgi_params && \
    rm -f /etc/nginx/snippets/fastcgi-php.conf /etc/nginx/snippets/snakeoil.conf
RUN apt-get update
RUN apt-get install nano
EXPOSE 80
EXPOSE 443
# RUN mkdir -p nginx/sites-available 
# RUN mkdir -p nginx/ssl
COPY /nginx/ssl/ /etc/nginx/ssl/
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY /nginx/sites-available/ /etc/nginx/sites-available/ 
RUN chown -R www-data:www-data /usr/share/nginx/html/* && \
chmod -R 0755 /usr/share/nginx/html/*

#ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
