#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

ros2 run mypkg battery &
PUB_PID=$!

sleep 5

ros2 topic echo /batterycheck > /tmp/mypkg.log &
ECHO_PID=$!

sleep 30

kill $PUB_PID
kill $ECHO_PID
wait $ECHO_PID

cat /tmp/mypkg.log

if grep -q 'data: ' /tmp/mypkg.log; then
    echo "Log contains 'data: '"
else
    echo "Log does not contain 'data: '"
fi

if [ -s /tmp/mypkg.log ]; then
   echo "Log "
else
   echo "noLog"
   exit 1

fi
