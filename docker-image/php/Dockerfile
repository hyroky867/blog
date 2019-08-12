FROM amazonlinux:1
# Initial Update
RUN yum -y update
# Set Localtime to Asia/Tokyo
RUN cp /etc/localtime /etc/localtime.org && \
    ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# Install php7.3 and httpd
RUN yum -y install php73 php73-devel php73-xml php73-pdo php73-mysqlnd php73-json php73-process php73-gd php73-mbstring php73-xdebug php73-bcmath php73-dbg xorg-x11-server-Xvfb wget zip git vi gcc php73-gmp

# Install php-ast for schemaspy
ADD https://github.com/nikic/php-ast/archive/v1.0.3.tar.gz /tmp/phpast.tar.gz
RUN tar zxvf /tmp/phpast.tar.gz && \
    cd php-ast-1.0.3 && \
    phpize && \
    ./configure && \
    make && make install

# Setup composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH $PATH:/var/www/html/
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

    ADD php.ini /etc/php-7.3.d/php-extension.ini

# setup nodejs
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN /bin/bash -c "source /root/.nvm/nvm.sh; nvm install 10.15.0"

RUN { \
echo 'export NVM_DIR=~/.nvm'; \
echo '. ~/.nvm/nvm.sh'; \
} > /root/.bashrc

WORKDIR /var/www/html

EXPOSE 80
EXPOSE 443
CMD ["httpd", "-DFOREGROUND"]
