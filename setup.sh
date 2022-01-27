#!/bin/bash
# USAGE: $ bash setup.sh
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
OUTPUT_FOLDER=${HOME}/bag2mp4

echo -e "${GREEN}Installing System dependencies ...${NC}"
sudo apt-get install ffmpeg

echo -e "${GREEN}Installing ROS dependencies ...${NC}"
sudo apt-get install ros-$ROS_DISTRO-rosbag ros-$ROS_DISTRO-image-view ros-$ROS_DISTRO-image-transport ros-$ROS_DISTRO-image-view

echo -e "${GREEN}Creating default output folder at ${OUTPUT_FOLDER} ...${NC}"
mkdir -p ${OUTPUT_FOLDER}