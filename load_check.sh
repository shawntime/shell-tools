#!/bin/bash

#使用uptime命令监控linux系统负载变化  

date=`date "+%Y-%m-%d"`

date_dir="/opt/shell/monitor/datetime-load_203.txt"
average_dir="/opt/shell/monitor/load_203.txt"
cpu_dir="/opt/shell/monitor/cpu_203.txt"
mem_dir="/opt/shell/monitor/mem_203.txt"
connect_dir="/opt/shell/monitor/connect_203.txt"
mu_dir="/opt/shell/monitor/load_day_203.$date.txt"

#取系统当前时间（以追加的方式写入文件>>）
date > $date_dir

#提取服务器1分钟、5分钟、15分钟的负载情况  
uptime | awk '{print $8,$9,$10,$11,$12,$13}' > $average_dir


#系统cpu使用情况
top -b -n 1 | grep Cpu  > $cpu_dir

#内存使用情况 
free |grep -1 Mem |tail -n +2|head -n 1 >  $mem_dir

#80端口连接数
echo connect: `netstat -nat|grep -i "80"|wc -l` > $connect_dir



#逐行连接上面的时间和负载相关行数据（每次重新写入文件>）  
paste  $date_dir $average_dir  $cpu_dir $mem_dir $connect_dir >> $mu_dir
