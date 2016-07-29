#!/bin/bash

while [ True ]
do
   dates=`date`
   curl "http://222.73.57.14/cgi-bin/mail.cgi?toUser=panghao@kunyan-inc.com&msg=nodata$dates"
   sleep 30
done
