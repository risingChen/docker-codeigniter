
/etc/init.d/nginx start
/etc/init.d/php5-fpm start
/etc/init.d/memcached start
#top
#ls -l  /var/log/
tail -f /var/log/nginx-access.log