#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

ros2 run mypkg battery & pub=i$!

timeout 60 ros2 topic echo /batterycheck > /tmp/mypkg.log 

kill $pub

cat /tmp/mypkg.log | grep 'data: 99'
