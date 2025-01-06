#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

ros2 run mypkg battery &
PUB_PID=$!

sleep 10

(ros2 topic echo /batterycheck > /tmp/mypkg.log &)&
sleep 30

kill $PUB_PID

cat /tmp/mypkg.log | grep 'data: 99'

if [ -s /tmp/mypkg.log ]; then
   echo "Log "
else
   echo "noLog"
   exit 1

fi
