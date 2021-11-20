FROM centos
RUN yum -y install gcc make pcre-devel zlib-devel tar zlib
ADD nginx-1.15.2.tar.gz /usr/src/
RUN cd /usr/src/nginx-1.15.2 \
    && mkdir /usr/local/nginx \
    && ./configure --prefix=/usr/local/nginx && make && make install \
    && ln -s /usr/local/nginx/sbin/nginx /usr/local/sbin/ \
    && nginx
 
RUN rm -rf /usr/src/nginx-1.15.2
 
EXPOSE 80
