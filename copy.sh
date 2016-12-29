#! /bin/bash 
FTP_SERVER=180.97.144.86
USER="root"
PASSWORD="GuaGua2014tc" 
FTP_PATH="/opt" 
LOCAL_PATH="/opt/log/debug" 
name_header=debug.log.
date=`date -d "1 day ago" +"%Y-%m-%d"`
file_name=$name_header$date
echo $file_name
if test -f /$LOCAL_PATH/$file_name 
then 
# file exits, so upload and print a message. 
scp -r -P 30330 /$LOCAL_PATH/$file_name $USER@$FTP_SERVER:/$FTP_PATH
echo "Done!" 
else 
# file doesn't exit, so we print a message and exit. 
echo "This file doesn't exit."
exit 
fi 
