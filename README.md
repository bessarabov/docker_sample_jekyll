
Building image:

    docker build --tag jekyll .

Running container (this builds jekyll site).
You should run in the working copy with jekyll site.
For example you can take https://github.com/jamtur01/james_blog

    docker run --volume $(pwd):/data --name jj jekyll

The compiled site will be placed in "/var/www/html".

There is a magic line in Dockerfile:

    VOLUME ["/data", "/var/www/html"]

To server this data via web server we need one more container

    docker run --volumes-from jj --publish 3000:3000 jekyll_server

To find out what is in that container you can run other container

    docker run --volumes-from jj --rm -it ubuntu:14.04 /bin/bash

To rebuild the jekyll site you need to say:

    docker start jj
