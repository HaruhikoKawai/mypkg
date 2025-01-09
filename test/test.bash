#!/bin/bash 
# SPDX-FileCopyrightText: 2024 Haruhiko Kawai
# SPDX-Licence-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source ~/ros2_ws/install/setup.bash
source ~/ros2_ws/install/local_setup.bash
source $dir/.bashrc

ros2 run mypkg battery &
PUB_PID=$!

ros2 topic echo /batterycheck > /tmp/mypkg.log &
ECHO_PID=$!

sleep 20

cat /tmp/mypkg.log

if grep -qE 'data: ([0-9]|[1-9][0-9])' /tmp/mypkg.log; then
    echo "OK"
else
    echo "NO"
fi

if [ -f /tmp/mypkg.log ]; then
   echo "Log "
else
   echo "noLog"
   exit 1

fi

kill $PUB_PID
kill $ECHO_PID
wait $ECHO_PID
