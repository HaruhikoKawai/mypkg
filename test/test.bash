#!/bin/bash 
# SPDX-FileCopyrightText: 2024 Haruhiko Kawai
# SPDX-Licence-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws

colcon build

source $dir/.bashrc


ros2 run mypkg battery &
PUB_PID=$!

sleep 5

stdbuf -oL ros2 topic echo /batterycheck > /tmp/mypkg.log &
ECHO_PID=$!

w=30
K=0

while [ ! -s /tmp/mypkg.log ] && [ $K -lt $w ]; do
    sleep 1
    K=$((K + 1))
done

if [ ! -s /tmp/mypkg.log ]; then
    echo "Log file is empty. Exiting."
    exit 1
fi

# プロセスの終了処理
if ps -p $PUB_PID > /dev/null; then
    kill $PUB_PID
    wait $PUB_PID
fi

if ps -p $ECHO_PID > /dev/null; then
    kill $ECHO_PID
    wait $ECHO_PID
fi

cat /tmp/mypkg.log

if grep -qE 'data: ([0-9]|[0-9][1-9])' /tmp/mypkg.log; then
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
