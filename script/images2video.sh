#!/bin/bash
# USAGE: $ bash images2video.sh <FRAME_RATE>
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
IMAGES_FOLDER="${HOME}/bag2mp4"

echo -e "${GREEN}Converting images from $IMAGES_FOLDER to video at $1 Hz ...${NC}"
cd $IMAGES_FOLDER
ffmpeg -r $1 -i frame%04d.jpg -c:v libx264 -vf "fps=$1,format=yuv420p" out.mp4
