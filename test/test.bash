#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

ros2 run mypkg battery &
PUB_PID=$!

sleep 5

timeout 60 ros2 topic echo /batterycheck > /tmp/mypkg.log &
ECHO_PID=$!

kill $PUB_PID
kill $ECHO_PID

cat /tmp/mypkg.log | grep 'data: 99'
