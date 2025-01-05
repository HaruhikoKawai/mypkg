import rclpy
from rclpy.node import Node
from std_msgs.msg import Int16
import psutil


def get_battery_percentage():
    battery = psutil.sensors_battery()
    if battery is not None:
        return battery.percent  # 残量
    return 0


def main(args=None):
    rclpy.init(args=args)    
    node = Node('battery')
    pub = node.create_publisher(Int16, 'batterycheck', 10)


    def tc():
        batterycheck = get_battery_percentage()
        batterycheck is not None
        msg = Int16()
        msg.data = int(batterycheck)
        pub.publish(msg)
        
    node.create_timer(5.0, tc)

    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('Node stopped by user.')
    finally:
        node.destroy_node()
        rclpy.shutdown()
