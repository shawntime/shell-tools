#!/bin/sh
cd /usr/local/nginx/logs

awk -F "|" '{print $1}' access.log  | awk -F ":" '{print $2}' | sort | uniq -c | awk '{if($1 > 5000) print $2}' | sed /^[[:space:]]*$/d > record.log

startcord='deny          '
endcord=';'

cat record.log | while read ip

do

echo $startcord$ip$endcord >> /usr/local/nginx/conf/blockips.conf

done

cd /usr/local/nginx/sbin

./nginx -s reload
