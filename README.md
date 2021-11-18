# Nginx-ssl-MultipleSites
This Project configueres ssl with Nginx using Docker
creates multiple sites 
pre-requisite

Install Docker

https://docs.docker.com/engine/install/ubuntu/

goto 

nano /etc/hosts

add following two lines after first two lines

127.0.0.1 example.com

127.0.0.1 public.com

create .env file copy the contents of environment file

commands:
1. docker-compose up -d --build
2. docker ps
3. docker exec -it "container-Id" bash
4. service nginx start
5. service php7.4-fpm start
6. ln -s /etc/nginx/sites-available/example.conf /etc/nginx/sites-enabled/example.conf
7. ln -s /etc/nginx/sites-available/public.conf /etc/nginx/sites-enabled/public.conf
8. service nginx restart
