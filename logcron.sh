#!/bin/bash
log_dir="/usr/local/nginx/logs"
date_dir=`date +\%Y-%m-%d`
/bin/mv ${log_dir}/access.log ${log_dir}/bak/access.log.${date_dir}
/bin/mv ${log_dir}/error.log ${log_dir}/bak/error.log.${date_dir}
kill -USR1 `cat  /usr/local/nginx/logs/nginx.pid`
~
