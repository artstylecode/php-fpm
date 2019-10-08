## php docker镜像构建
### 构建本地镜像
*docker build -t php-fpm:local .*

### 推送至阿里云镜像仓库（需要登录）
*docker login --username=artcoding163 registry.cn-shenzhen.aliyuncs.com*
*docker tag php-fpm:local registry.cn-shenzhen.aliyuncs.com/artcoding/php-fpm7.2:dev*
*docker push registry.cn-shenzhen.aliyuncs.com/artcoding/php-fpm7.2:dev*