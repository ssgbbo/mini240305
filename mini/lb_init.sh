#!/bin/bash
# echo "upstream web {" > /usr/local/apache2/conf/upstream.conf
# for SERVER in $BACKEND_SERVERS; do
# 	echo "	server $SERVER;" >> /usr/local/apache2/conf/upstream.conf
# done
# echo "}" >> /usr/local/apache2/conf/upstream.conf
# ​
# cat /usr/local/apache2/conf/upstream.conf
echo "upstream web {" >> /etc/nginx/conf.d/default.conf
for SERVER in $BACKEND_SERVERS; do
    echo "    server $SERVER;" >> /etc/nginx/conf.d/default.conf
done
echo "}" >> /etc/nginx/conf.d/default.conf

cat /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'