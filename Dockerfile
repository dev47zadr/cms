FROM ubuntu:20.04

LABEL "org.opencontainers.image.authors"="dev47zadr@gmail.com"
LABEL "name"="Web Server CMS"
LABEL "version"="1.0.0"

## Install apache2
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y install \
    apache2 \
    libapache2-mod-php8.0
EXPOSE 80

WORKDIR /var/www/html
RUN rm -rf *.*
COPY . .

CMD apachectl -D FOREGROUND