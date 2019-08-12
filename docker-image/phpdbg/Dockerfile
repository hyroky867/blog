FROM amazonlinux:1
# Initial Update
RUN yum -y update
# Set Localtime to Asia/Tokyo
RUN cp /etc/localtime /etc/localtime.org && \
    ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# Install php7.1 and httpd
RUN yum -y install php71 php71-xml php71-pdo php71-mysqlnd php71-json php71-process php71-gd php71-mbstring php71-xdebug php71-bcmath php71-dbg xorg-x11-server-Xvfb wget zip git vi

# Setup composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH $PATH:/var/www/html/
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

ADD ./docker-image/phpdbg/php.ini /usr/local/etc/php/

# setup nodejs
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN /bin/bash -c "source /root/.nvm/nvm.sh; nvm install 8.11.4"

RUN { \
echo 'export NVM_DIR=~/.nvm'; \
echo '. ~/.nvm/nvm.sh'; \
} > /root/.bashrc

CMD /bin/bash -c "source /root/.nvm/nvm.sh; nvm use 8.11.4"

# Setup mysqld 
RUN yum -y install mysql57-server mysql57
RUN echo "NETWORKING=1" > /etc/sysconfig/network

# setup dynamodb
ADD ./docker-image/phpdbg/dynamodb_local_latest /root/dynamo_db
RUN yum -y install java

WORKDIR /var/www/html
# Setup php settings

COPY ./ /var/www/html
CMD ["/sbin/init"]
