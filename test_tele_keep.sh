#!/bin/bash
while [ True ]
do
pid=`pidof test_run_shanghai`
if [ -z $pid ]
then
 echo "start tele"
 nohup ./test_run_shanghai >> log.txt &
fi
sleep 30
done
