cmake_minimum_required(VERSION 3.0.2)
project(bag2mp4)

find_package(catkin REQUIRED COMPONENTS
  rosbag
  image_transport
  image_view
)

catkin_package(
)
