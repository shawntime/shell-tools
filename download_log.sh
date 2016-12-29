#! /bin/bash 

desc_path="/opt" 
local_path="/opt/log/debug" 
name_header=/opt/log/customelogstatisLog_
date=`date -d "1 day ago" +"%Y-%m-%d"`
echo $file_name

for ip in 102 103 104 105 
do
	echo root@120.132.38.$ip:$name_header$ip.log.$date
	scp -r -P 30330 root@120.132.38.$ip:$name_header$ip.log.$date /opt
done

exit 
fi
