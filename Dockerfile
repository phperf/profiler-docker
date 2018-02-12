FROM php:7.2-cli

RUN curl "https://github.com/tideways/php-profiler-extension/archive/v4.1.4.tar.gz" -fsL -o ./a.tar.gz  && \
     tar xf ./a.tar.gz && \
     cd ./php-profiler-extension-4.1.4 && \
     ls -la && \
     phpize && \
     ./configure && \
     make && \
     make install && \
     cd .. && rm -rf ./a.tar.gz ./php-profiler-extension-4.1.4 && \
     docker-php-ext-enable tideways

RUN apt-get update && apt-get install -y graphviz

COPY ./prepend_v4.php /prepend.php

COPY ./php.ini /usr/local/etc/php/

COPY ./xhprof/xhprof_lib/utils /utils

ENV SVG=$SVG

WORKDIR /code