FROM ubuntu:14.04

RUN apt-get update

RUN apt-get install -y \
    make \
    nodejs \
    ruby \
    ruby-dev

RUN gem install jekyll --verbose

VOLUME ["/data", "/var/www/html"]

WORKDIR /data

CMD jekyll build --destination /var/www/html
