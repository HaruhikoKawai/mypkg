import rclpy
from rclpy.node import Node
from std_msgs.msg import Int16
import psutil


def get_battery_percentage():
    battery = psutil.sensors_battery()
    if battery is not None:
        return battery.percent  # 残量
    return None


def main(args=None):
    rclpy.init(args=args)    
    node = Node('battery')
    pub = node.create_publisher(Int16, 'batterycheck', 10)

<<<<<<< main
def main():
    node.create_timer(0.5, cb)
    rclpy.spin(node)
=======

    def tc():
        batterycheck = get_battery_percentage()
        batterycheck is not None
        msg = Int16()
        msg.data = int(batterycheck)
        pub.publish(msg)
        
    node.create_timer(1.0, tc)

    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('Node stopped by user.')
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
>>>>>>> local
