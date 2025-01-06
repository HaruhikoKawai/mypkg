#SPDX-FileCopyrightText: 2024 Haruhiko Kawai 
#SPDX-Licence-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import Int16
import psutil


def get_battery_percentage():
    battery = psutil.sensors_battery()
    if battery is not None:
        return battery.percent  # 残量
    return 0


def main():
    rclpy.init()    
    node = Node('battery')
    pub = node.create_publisher(Int16, 'batterycheck', 10)

    def tc():
        batterycheck = get_battery_percentage()
        batterycheck is not None
        msg = Int16()
        msg.data = int(batterycheck)
        pub.publish(msg)
        
    node.create_timer(1.0, tc)

    rclpy.spin(node)

