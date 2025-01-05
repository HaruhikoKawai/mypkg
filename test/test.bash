#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

timeout 60 ros2 run mypkg battery > /tmp/mypkg.log

cat /tmp/mypkg.log | grep 'data: 99'
