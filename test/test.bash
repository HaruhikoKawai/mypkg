#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

ros2 run mypkg battery &
PUB_PID=$!

sleep 5

timeout 30 ros2 topic echo /batterycheck > /tmp/mypkg.log 

kill $PUB_PID

cat /tmp/mypkg.log | grep 'data: '
