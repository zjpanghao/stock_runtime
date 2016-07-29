#!/bin/bash
timeoutc=0
runstatus=0
while [ True ]
min=`date --date "2 min ago" +%Y%m%d%H%M`
do
 #total=`cat log.txt|grep "$min push data success and"|awk '{total+=$9}END{print total}'`
 total=`cat log.txt|grep "push data success time: $min"|wc -l`
 echo $total
 if [ -z $total ] || [ $total -eq 0 ]
 then
   echo "zero $timeoutc"
   let timeoutc++
   if [ $timeoutc -gt 3 ]
   then
   echo "kill it"
   pidof test_run_shanghai|xargs kill -9
   timeoutc=0
   
   if [ $runstatus -gt 0 ]
   then
   curl "http://222.73.57.14/cgi-bin/mail.cgi?toUser=panghao@kunyan-inc.com&msg=nodata$min"
   runstatus=0
   fi
   sleep 30
   fi
 else
   timeoutc=0
   let runstatus++
   if [ $runstatus -eq 3 ]
   then
     
   curl "http://222.73.57.14/cgi-bin/mail.cgi?toUser=panghao@kunyan-inc.com&msg=dataok$min"

   fi
 fi
 
 echo $total >> st.txt
 echo $min >> st.txt
 sleep 60
done
