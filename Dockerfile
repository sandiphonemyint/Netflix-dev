FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y apache2 && \
    apt-get clean

# Change Apache to listen on port 4000 (both main config and default site)
RUN sed -i 's/80/4000/' /etc/apache2/ports.conf && \
    sed -i 's/80/4000/' /etc/apache2/sites-available/000-default.conf

COPY . /var/www/html/

EXPOSE 4000

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

