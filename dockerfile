FROM php:7.2-fpm
RUN docker-php-ext-install bcmath sockets pcntl
## 安装zip扩展
RUN apt-get update && apt-get install -y libzip-dev
RUN pecl install zip && docker-php-ext-enable zip

##安装swoole redis xdebug插件
RUN pecl install redis-4.0.1 \
     && pecl install swoole\
    && docker-php-ext-enable redis swoole 
#替换插件配置
#COPY ./conf/conf.d/docker-php-ext-xdebug.ini  /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#COPY ./conf/php.ini /usr/local/etc/php/php.ini
#安装composer、laravel-installer
COPY ./shell/* /home/app/shell/
RUN chmod 777 /home/app/shell/*.sh
RUN ls -l /home/app/shell/
WORKDIR /home/app
RUN sh /home/app/shell/composer.sh
RUN composer diagnose&&composer global require laravel/installer